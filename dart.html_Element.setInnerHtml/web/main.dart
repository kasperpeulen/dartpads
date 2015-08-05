import 'dart:html';

main() {
  // href tag will be removed without nodevalidator
  DivElement defaultValidator = new DivElement()
    ..setInnerHtml('Go to <a href="http://www.google.com">www.google.com</a>');

  // nothing will be removed with the TrustedNodeValidator
  DivElement trustedValidator = new DivElement()
    ..setInnerHtml('Go to <a href="http://www.google.com">www.google.com</a>',
        validator: new TrustedNodeValidator());

  document.body
    ..append(trustedValidator)
    ..append(defaultValidator);
}

/// A [NodeValidator] which allows everything.
class TrustedNodeValidator implements NodeValidator {
  bool allowsElement(Element element) => true;
  bool allowsAttribute(element, attributeName, value) => true;
}