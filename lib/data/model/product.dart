import 'package:para_2/domain/entity/product_entity.dart';

class Product extends ProductEntity {
  late int id;
  final String product;
  double cent;
  final String description;
  int id_proizvod;
  int id_CateSubcate;
  

  Product (this.id, this.product,  this.cent, this.description, this.id_proizvod, this.id_CateSubcate)
      : super(id, product, cent, description, id_proizvod, id_CateSubcate);

      Map<String, dynamic> toMap() => {
        'id': id,
        'product': product,
        'cent': cent,
        'description': description,
        'id_proizvod': id_proizvod,
        'id_CateSubcate':id_CateSubcate,
      };

      factory Product.toFromMap(Map<String, dynamic> json) => Product(json['id'],
      json['product'], json['cent'], json['description'], json['id_proizvod'], json['id_CateSubcate']);
}