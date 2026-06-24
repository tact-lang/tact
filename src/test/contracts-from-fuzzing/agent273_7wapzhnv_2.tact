struct DeepNested {
  inside: NestedLayer;
}

struct NestedLayer {
  int1: Int;
  inner: FinalLayer;
}

struct FinalLayer {
  flag: Bool;
  text: String;
}

contract TestContract {
  data: DeepNested;

  init() {
    self.data = DeepNested{
      inside: NestedLayer{
        int1: 42,
        inner: FinalLayer{
          flag: false,
          text: "hello"
        }
      }
    };
  }
}