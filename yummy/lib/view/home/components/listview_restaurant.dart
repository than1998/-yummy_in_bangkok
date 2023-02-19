import 'package:flutter/material.dart';
import 'package:yummy/services/endpoints.dart';

import '../../../models/place_data_model.dart';

Widget listViewRestaurant(context,List<Result> restaurantList) {
  return  ListView.builder(
    shrinkWrap: true,
    itemCount: restaurantList.length,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 1),
          borderRadius: BorderRadius.all(
              Radius.circular(8)
          ),
        ),
        margin: EdgeInsets.only(bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ), // Image border
              child: restaurantList[index].photos !=null && restaurantList[index].photos!.isNotEmpty && restaurantList[index].photos!.first.photoReference != null && restaurantList[index].photos!.first.photoReference!.isNotEmpty
                      ? FadeInImage(
                        width: 125,
                        height: 100,
                        fit: BoxFit.cover,
                        image: NetworkImage('${Endpoints.baseURL}${Endpoints.photoURL}${restaurantList[index].photos?.first.photoReference}&key=${Endpoints.keyGoogleMap}'),
                        placeholder: AssetImage('assets/image/shop.png')
                      )
                  : Image.asset(
                      width: 125,
                      height: 100,
                      fit: BoxFit.cover,
                      'assets/image/shop.png',
                    ),
            ),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(restaurantList[index].name??'',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),maxLines: 2, overflow: TextOverflow.ellipsis),
                      Text(restaurantList[index].formattedAddress??'',style: TextStyle(fontSize: 13),maxLines: 3, overflow: TextOverflow.ellipsis),
                    ],
                  ),
                )
            ),
          ],
        ),
      );
    },
  );
}