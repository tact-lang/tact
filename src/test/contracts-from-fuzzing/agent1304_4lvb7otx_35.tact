struct Inner { val:Int }
struct Middle { i:Inner? }

contract OptWrapped {
  data: Middle?;

  init() {
    self.data = null;
  }
}