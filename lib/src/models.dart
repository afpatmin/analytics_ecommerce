@JS()
library gtag_analytics.ecommerce;

import 'package:js/js.dart';

@JS()
@anonymous
abstract class EventData {
  external String get event;
  external set event(String v);

  external EcommerceData get ecommerce;
  external set ecommerce(EcommerceData v);

  external factory EventData({String event, EcommerceData ecommerce});
}

@JS()
@anonymous
abstract class EcommerceData {
  external ClickData get click;
  external set click(ClickData v);

  external DetailData get detail;
  external set detail(DetailData v);

  external AddData get add;
  external set add(AddData v);

  external RemoveData get remove;
  external set remove(RemoveData v);

  external CheckoutData get checkout;
  external set checkout(CheckoutData v);

  external CheckoutOptionData get checkout_option;
  external set checkout_option(CheckoutOptionData v);

  external PurchaseData get purchase;
  external set purchase(PurchaseData v);

  /// The currency code (e.g. EUR, SEK, USD, etc)
  external String get currencyCode;
  external set currencyCode(String v);

  external List<ImpressionData> get impressions;
  external set impressions(List<ImpressionData> v);

  external factory EcommerceData(
      {ClickData click,
      DetailData detail,
      AddData add,
      RemoveData remove,
      CheckoutData checkout,
      CheckoutOptionData checkout_option,
      PurchaseData purchase,
      String currencyCode,
      List<ImpressionData> impressions});
}

/// Represents information about a product that has been viewed. It is referred to as an impressionFieldObject.
/// One of id or name must be set, all other fields are optional.
@JS()
@anonymous
class ImpressionData {
  /// The product ID or SKU (e.g. P67890).
  external String get id;

  external set id(String v);

  /// The name of the product (e.g. Android T-Shirt).
  external String get name;
  external set name(String v);

  /// The list or collection to which the product belongs (e.g. Search Results)
  external String get list;
  external set list(String v);

  /// The brand associated with the product (e.g. Google).
  external String get brand;
  external set brand(String v);

  /// The category to which the product belongs (e.g. Apparel). Use / as a delimiter to specify up to 5-levels of hierarchy (e.g. Apparel/Men/T-Shirts).
  external String get category;
  external set category(String v);

  /// The variant of the product (e.g. Black).
  external String get variant;
  external set variant(String v);

  /// The product's position in a list or collection (e.g. 2).
  external int get position;
  external set position(int v);

  /// The price of a product (e.g. 29.20).
  external num get price;
  external set price(num v);

  /// Represents information about a product that has been viewed. It is referred to as an impressionFieldObject.
  /// One of id or name must be set, all other fields are optional.
  external factory ImpressionData(
      {String id,
      String name,
      String list,
      String brand,
      String category,
      String variant,
      int position,
      num price});
}

/// Product data represents individual products that were viewed, added to the shopping cart, etc. It is referred to as a productFieldObject.
/// One of id or name must be set, all other fields are optional.
@JS()
@anonymous
class ProductData {
  /// The product ID or SKU (e.g. P67890).
  external String get id;
  external set id(String v);

  /// The name of the product (e.g. Android T-Shirt).
  external String get name;
  external set name(String v);

  /// The brand associated with the product (e.g. Google).
  external String get brand;
  external set brand(String v);

  /// The category to which the product belongs (e.g. Apparel). Use / as a delimiter to specify up to 5-levels of hierarchy (e.g. Apparel/Men/T-Shirts).
  external String get category;
  external set category(String v);

  /// The variant of the product (e.g. Black).
  external String get variant;
  external set variant(String v);

  /// The price of a product (e.g. 29.20).
  external num get price;
  external set price(num v);

  /// The quantity of a product (e.g. 2).
  external int get quantity;
  external set quantity(int v);

  /// The coupon code associated with a product (e.g. SUMMER_SALE13).
  external String get coupon;
  external set coupon(String v);

  /// The product's position in a list or collection (e.g. 2).
  external int get position;
  external set position(int v);

  /// Product data represents individual products that were viewed, added to the shopping cart, etc. It is referred to as a productFieldObject.
  /// One of id or name must be set, all other fields are optional.
  external factory ProductData(
      {String id,
      String name,
      String brand,
      String category,
      String variant,
      String price,
      String quantity,
      String coupon,
      String position});
}

/// Represents information about an ecommerce related action that has taken place. It is referred to as an actionFieldObject.
/// id is required if the action type is purchase or refund
@JS()
@anonymous
class ActionData {
  /// The transaction ID (e.g. T1234).
  /// Required if the action type is purchase or refund
  external String get id;
  external set id(String v);

  /// The store or affiliation from which this transaction occurred (e.g. Google Store).
  external String get affiliation;
  external set affiliation(String v);

  /// Specifies the total revenue or grand total associated with the transaction (e.g. 11.99).
  /// This value may include shipping, tax costs, or other adjustments to total revenue that you want to include as part of your revenue calculations.
  /// Note: If revenue is not set, its value will be automatically calculated using the product quantity and price fields of all products in the same hit.
  external num get revenue;
  external set revenue(num v);

  /// The total tax associated with the transaction.
  external num get tax;
  external set tax(num v);

  /// The shipping cost associated with the transaction.
  external num get shipping;
  external set shipping(num v);

  /// The transaction coupon redeemed with the transaction.
  external String get coupon;
  external set coupon(String v);

  /// The list that the associated products belong to.
  external String get list;
  external set list(String v);

  /// A number representing a step in the checkout process.
  external int get step;
  external set step(int v);

  /// Additional field for checkout and checkout_option actions that can describe option information on the checkout page, like selected payment method.
  external String get option;
  external set option(String v);

  /// Represents information about an ecommerce related action that has taken place. It is referred to as an actionFieldObject.
  /// id is required if the action type is purchase or refund
  external factory ActionData(
      {String id,
      String affiliation,
      num revenue,
      num tax,
      num shipping,
      String coupon,
      String list,
      int step,
      String option});
}

@JS()
@anonymous
class ClickData {
  external ActionData get actionField;
  external set actionField(ActionData v);

  external List<ProductData> get products;
  external set product(List<ProductData> v);

  external factory ClickData(
      {ActionData actionField, List<ProductData> products});
}

@JS()
@anonymous
class DetailData {
  external ActionData get actionField;
  external set actionField(ActionData v);

  external List<ProductData> get products;
  external set product(List<ProductData> v);

  external factory DetailData(
      {ActionData actionField, List<ProductData> products});
}

@JS()
@anonymous
class AddData {
  external List<ProductData> get products;
  external set product(List<ProductData> v);

  external factory AddData({List<ProductData> products});
}

@JS()
@anonymous
class RemoveData {
  external List<ProductData> get products;
  external set product(List<ProductData> v);

  external factory RemoveData({List<ProductData> products});
}

@JS()
@anonymous
class CheckoutData {
  external ActionData get actionField;
  external set actionField(ActionData v);

  external List<ProductData> get products;
  external set product(List<ProductData> v);

  external factory CheckoutData(
      {ActionData actionField, List<ProductData> products});
}

@JS()
@anonymous
class CheckoutOptionData {
  external ActionData get actionField;
  external set actionField(ActionData v);

  external factory CheckoutOptionData({ActionData actionField});
}

@JS()
@anonymous
class PurchaseData {
  external ActionData get actionField;
  external set actionField(ActionData v);

  external List<ProductData> get products;
  external set products(List<ProductData> v);

  external factory PurchaseData(
      {ActionData actionField, List<ProductData> products});
}
