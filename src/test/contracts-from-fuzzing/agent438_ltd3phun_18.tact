struct DeeplyNestedOptional {
  inner: Int?;
}

struct Container {
  val: DeeplyNestedOptional?;
}

contract TestContract {
  data: Container;

  init() {
    self.data = Container {
      val: DeeplyNestedOptional{ inner: 10 }
    };
  }
}