struct Inner { x: Int }
struct Middle { val: Inner? }

contract OptStructStruct {
  val: Middle?;

  init() {
    self.val = null;
  }
}
