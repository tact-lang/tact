struct DeepNested {
  inner: Inner;
}

struct Inner {
  inner2: Inner2;
}

struct Inner2 {
  inner3: Inner3;
}

struct Inner3 {
  num: Int;
  flag: Bool?;
}

contract TestContract {
  data: DeepNested;

  init() {
    self.data = DeepNested{
      inner: Inner{
        inner2: Inner2{
          inner3: Inner3{
            num: 123,
            flag: true
          }
        }
      }
    };
  }
}
