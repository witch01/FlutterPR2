import 'package:para_2/domain/entity/catysubcaty_entity.dart';

class Catysabcaty extends CatysabcatyEntity {
  late int id;
  int id_subcategories;
  int id_categories;

  Catysabcaty (this.id, this.id_categories, this.id_subcategories)
      : super(id, id_categories, id_subcategories);

      Map<String, dynamic> toMap() => {
        'id': id,
        'id_subcategories': id_subcategories,
        'id_categories': id_categories,
      };

      factory Catysabcaty.toFromMap(Map<String, dynamic> json) => Catysabcaty(json['id'],
      json['id_subcategories'], json['id_categories']);
}