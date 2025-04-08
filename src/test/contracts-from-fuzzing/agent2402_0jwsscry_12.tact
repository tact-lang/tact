struct OptionStr {
  s: String?;
}

struct Container {
  a: Int;
  b: OptionStr;
}

contract OptStrTest {
  dat: Container;

  init() {
    self.dat = Container{
      a: 1,
      b: OptionStr{
        s: null
      }
    };
  }
}