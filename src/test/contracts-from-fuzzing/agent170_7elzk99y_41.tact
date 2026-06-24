// optional struct that defaults to null in contract storage
struct MayBeNull {
  a: Int;
}

contract OptStructNull {
  data: MayBeNull? = null;

  init() {
    self.data = null;
  }
}