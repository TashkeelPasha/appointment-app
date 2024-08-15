class CategoryModel{
  String vector;
  bool isSelected;
  String name;

  CategoryModel({
    required this.isSelected,
    required this.vector,
    required this.name
  });

  

  static List<CategoryModel> getCategories(){
   List<CategoryModel> categories = [];
  
  categories.add(
    CategoryModel(
      vector: 'assets/vectors/dentist.svg',
      isSelected: false,
      name: 'Dentist'
    )
  );
  categories.add(
    CategoryModel(
      vector: 'assets/vectors/bone.svg',
      isSelected: false,
      name: 'Orthopedic'
    )
  );

  categories.add(
    CategoryModel(
      vector: 'assets/vectors/heart.svg',
      isSelected: false,
      name: 'Cardiologist'
    )
  );
  return categories;
  }
}