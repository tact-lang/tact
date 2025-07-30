struct Ololo { s: String; }

struct Wrapper {
  data: Ololo?;
}

contract OptionalWrapper {
  val: Wrapper;

  init() {
    self.val = Wrapper{
      data: null
    };
  }
}