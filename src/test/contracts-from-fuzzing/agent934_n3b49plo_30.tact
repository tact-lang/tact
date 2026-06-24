struct Inner { x: Int }

contract InitOptionalNested {
  data: Inner?;
  init() {
    self.data = null;
  }
}