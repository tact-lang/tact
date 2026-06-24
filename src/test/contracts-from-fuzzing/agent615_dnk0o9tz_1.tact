struct DeepNested {
  foo: Int;
  bar: Inner;
}

struct Inner {
  a: Inner2;
}

struct Inner2 {
  b: Int;
}

contract TestContract {
  val: DeepNested;

  init() {
    self.val = DeepNested{
      foo: 1,
      bar: Inner{
        a: Inner2{
          b: 2
        }
      }
    };
  }
}