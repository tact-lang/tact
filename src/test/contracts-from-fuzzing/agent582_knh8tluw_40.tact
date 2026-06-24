struct Wrapper {
  s: Inner?;
}

struct Inner {
  n: Int;
  s: String?;
}

contract OptInStructField {
  val: Wrapper;

  init() {
    self.val = Wrapper{
      s: Inner{
        n: 5,
        s: null
      }
    };
  }
}
