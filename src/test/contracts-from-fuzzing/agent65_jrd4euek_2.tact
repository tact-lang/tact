struct NestedDeeply {
  x: Int;
  y: Bool?;
  z: String;
}

struct Wrap1 {
  inner: NestedDeeply;
}

struct Wrap2 {
  inner: Wrap1;
}

contract DeepNestTest {
  data: Wrap2;
  init() {
    self.data = Wrap2{
      inner: Wrap1{
        inner: NestedDeeply{
          x: 10,
          y: null,
          z: "Z"
        }
      }
    };
  }
}