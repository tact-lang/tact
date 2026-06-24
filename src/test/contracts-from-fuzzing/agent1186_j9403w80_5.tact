struct DeepLevel3 {
  z: Int;
}

struct DeepLevel2 {
  y: DeepLevel3;
}

struct DeepLevel1 {
  x: DeepLevel2;
}

contract DeeplyNestedStructContract {
  foo: DeepLevel1;

  init() {
    self.foo = DeepLevel1{
      x: DeepLevel2{
        y: DeepLevel3{
          z: 123,
        },
      },
    };
  }
}
