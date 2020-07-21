import '../analytics_ecommerce.dart';
import 'interrop/data_layer.dart' as dl;
import 'models.dart';

class AnalyticsEcommerce {
  AnalyticsEcommerce();

  /// Measures product impressions and also tracks a standard
  /// pageview for the tag configuration.
  /// Product impressions are sent by pushing an impressions object
  /// containing one or more impressionFieldObjects.
  void measureProductImpressions(
      String currencyCode, List<ImpressionData> impressions) {
    dl.push(EventData(
        ecommerce: EcommerceData(
            currencyCode: currencyCode, impressions: impressions)));
  }

  /// Call this function when a user clicks on a product link. This function uses the event
  /// callback datalayer variable to handle navigation after the ecommerce data has been sent
  /// to Google Analytics.
  /// `list` is an optional argument to specify where the product was listed when clicked (i.e. 'Product Gallery')
  void measureProductClick(ProductData productData, {String list}) {
    dl.push(EventData(
        event: 'productClick',
        ecommerce: EcommerceData(
            click: ClickData(
                actionField: ActionData(list: list),
                products: [productData]))));
  }

  /// Measure a view of product details.
  /// `list` is an optional argument to specify where the product was listed when viewed (i.e. 'Product Gallery')
  void measureProductDetailView(ProductData productData, {String list}) {
    dl.push(EventData(
        ecommerce: EcommerceData(
            detail: DetailData(
                actionField: ActionData(list: list),
                products: [productData]))));
  }

  /// Measure when a product is added to the cart
  void measureAddToCart(List<ProductData> products, String currencyCode) {
    dl.push(EventData(
        event: 'addToCart',
        ecommerce: EcommerceData(
            currencyCode: currencyCode, add: AddData(products: products))));
  }

  /// Measure when a product is removed from the cart
  void measureRemoveFromCart(List<ProductData> products, String currencyCode) {
    dl.push(EventData(
        event: 'removeFromCart',
        ecommerce: EcommerceData(
            currencyCode: currencyCode,
            remove: RemoveData(products: products))));
  }

  /// A function to handle a click on a checkout button.
  void measureCheckout(List<ProductData> products, {int step, String option}) {
    dl.push(EventData(
        event: 'checkout',
        ecommerce: EcommerceData(
            checkout: CheckoutData(
                actionField: ActionData(step: step, option: option),
                products: products))));
  }

  /// The checkout option is useful in cases where you've already measured a checkout step but you want to capture additional information about the same checkout step.
  /// For example, the shipping method selected by a user. To measure this use the checkout_option action along with the step and option fields.
  /// `step` and `option` are required
  void measureCheckoutOption({int step, String option}) {
    dl.push(EventData(
        event: 'checkoutOption',
        ecommerce: EcommerceData(
            checkout_option: CheckoutOptionData(
                actionField: ActionData(option: option, step: step)))));
  }

  void measurePurchase(ActionData actionField, List<ProductData> products) {
    dl.push(EventData(
        ecommerce: EcommerceData(
            purchase:
                PurchaseData(actionField: actionField, products: products))));
  }
}
