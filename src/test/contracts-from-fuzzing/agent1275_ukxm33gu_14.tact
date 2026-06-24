struct SuperNested {
  layer1: Layer1;
}
struct Layer1 {
  layer2: Layer2;
}
struct Layer2 {
  layer3: Layer3;
}
struct Layer3 {
  foo: String;
  bar: Bool;
  baz: Int;
}

contract VeryDeepNestedStorage {
  data: SuperNested;

  init() {
    self.data = SuperNested{
      layer1: Layer1{
        layer2: Layer2{
          layer3: Layer3{
            foo: "hi",
            bar: true,
            baz: 123
          }
        }
      }
    };
  }
}