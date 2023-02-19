import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_controller.dart';
import 'components/listview_restaurant.dart';

class HomeView extends StatelessWidget {
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Obx((){
        return SafeArea(
          child : Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 24,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                      }, icon: Icon(Icons.location_on_outlined,color: Colors.black,size: 24,)
                    ),
                  ),
                ),
                Text(
                  "Yummy" , style: TextStyle(fontSize: 36),
                ),
                Text(
                  "in Bangkok" , style: TextStyle(fontSize: 16),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black,width: 2),
                    borderRadius: BorderRadius.all(
                        Radius.circular(8)
                    ),
                  ),
                  margin:EdgeInsets.only(top: 16),
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search,color: Colors.black,),
                      hintText: 'ค้นหาร้านค้าที่คุณต้องการ',
                    ),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      homeController.searchRestaurant(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(homeController.textTitle.value,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
                Expanded(
                    child:homeController.showListView.value
                        ? Container(margin: EdgeInsets.only(top: 16),child: listViewRestaurant(context,homeController.restaurantList))
                        : Center(
                              child: SingleChildScrollView(
                                  child: imageView(),
                            ),
                        ),
                ),
              ],
            ),
          )
      );
      })
    );
  }

  Column imageView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          homeController.image.value,
        ),
        Text(homeController.textImage.value,style: TextStyle(color: Colors.black,fontSize: 15),),
      ],
    );
  }

}