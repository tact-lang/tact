struct MultiNested {
  a: Int;
  b: Int;
}

struct Wrapper {
  inner: MultiNested;
  val: Int;
}

struct Container {
  wrap: Wrapper;
  s: String;
}

contract ComplexNest {
  data: Container;
  init() {
    self.data = Container{
      wrap: Wrapper{
        inner: MultiNested{
          a: 1,
          b: 2
        },
        val: 3
      },
      s: "test"
    };
  }
}