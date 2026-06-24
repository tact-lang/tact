struct OptionalStructField { val: Int }

contract OptStructField {
  structRef: OptionalStructField?;

  init() {
    self.structRef = null;
  }
}