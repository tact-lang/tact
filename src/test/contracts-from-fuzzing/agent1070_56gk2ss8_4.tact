struct NestedOptional {
  opt1: Int?;
  opt2: String?;
  opt3: Bool?;
}

struct Container {
  inner: NestedOptional?;
}

contract OptTest {
  data: Container;

  init() {
    self.data = Container{
      inner: NestedOptional{
        opt1: null,
        opt2: null,
        opt3: true
      }
    };
  }
}