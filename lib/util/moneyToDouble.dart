double moneyToDouble(String money){
  String newString = money.substring(2);
  return double.parse(newString);
}