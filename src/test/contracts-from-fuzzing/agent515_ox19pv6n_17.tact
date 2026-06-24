struct Info { x: Int = 1; }

contract Test(
  param: Info?,
) {
  receive() {
    if (self.param != null) {
      let _ = self.param!!.x;
    }
  }
}