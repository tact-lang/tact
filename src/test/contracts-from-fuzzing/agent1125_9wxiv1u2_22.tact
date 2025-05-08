struct OneField { x: Int }

contract InitField {
  val: OneField;
  init() {
    self.val = OneField{ x: 123 };
  }
}