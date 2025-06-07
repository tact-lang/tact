struct DeepNested {
  x: Int;
  y: String;
  z: Bool;
}

struct NestedLevel2 {
  inner: DeepNested;
}

struct NestedLevel1 {
  middle: NestedLevel2;
}

contract TestContract {
  data: NestedLevel1;
  init() {
    self.data = NestedLevel1{
      middle: NestedLevel2{
        inner: DeepNested{
          x: 1,
          y: "hi",
          z: true,
        },
      },
    };
  }
}
