import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yummy/models/place_data_model.dart';
import '../services/api_provider.dart';

class HomeController extends GetxController {

  RxBool showListView = false.obs;
  RxString textSearch = "".obs;
  RxString textTitle = "ร้านอาหารทั้งหมด".obs;
  RxString image = "assets/image/shop.png".obs;
  RxString textImage = "ค้นหาร้านค้าที่คุณต้องการ".obs;

  var restaurantList = <Result>[].obs;

  @override
  void onInit() {
    super.onInit();

  }

  searchRestaurant(value) {
    textSearch.value = value;
    if (textSearch.value.isEmpty)
    {
      Get.showSnackbar(
        GetSnackBar(
          message: "กรุณากรอกชื่อร้านค้าที่ต้องการค้นหา",
          duration: Duration(seconds: 3),
        ),
      );
      textTitle.value = "ร้านอาหารทั้งหมด";
      image.value = "assets/image/shop.png";
      textImage.value = "ค้นหาร้านค้าที่คุณต้องการ";
      showListView.value = false;
    }
    else
    {
      textTitle.value = "ค้นหา '${textSearch.value}'";
      getApiPlace();
    }

  }

  getApiPlace() async {
    PlaceData? placeData;
    try {
      placeData = await ApiProvider().getPlaceData(textSearch.value);
    } finally {
          if (placeData != null && placeData.results != null)
          {
            var bangkokLocation = placeData.results!.where((item) => item.formattedAddress!.contains('กรุงเทพมหานคร')).toList();
            restaurantList.value = bangkokLocation;
            if (restaurantList.value.isNotEmpty) {
              showListView.value = true;
            } else {
              image.value = "assets/image/search.png";
              textImage.value = "ไม่พบร้านอาหาร '${textSearch.value}'";
          showListView.value = false;
        }
      }
      else
      {
        image.value = "assets/image/search.png";
        textImage.value = "ไม่พบร้านอาหาร '${textSearch.value}'";
        showListView.value = false;
      }
    }
  }

}