struct Inner {
  text1: String?;
  text2: String?;
}

struct Middle {
  inner: Inner?;
  plain: String?;
}

contract TestContract {
  data: Middle;

  init() {
    self.data = Middle{
      inner: null,
      plain: null
    };
  }
}