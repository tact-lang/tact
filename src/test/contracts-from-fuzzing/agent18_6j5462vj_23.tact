struct Layer1 {
  foo: Int;
}
struct Layer2 {
  l1: Layer1;
}
struct Layer3 {
  l2: Layer2;
}
struct Layer4 {
  l3: Layer3;
}
struct Layer5 {
  l4: Layer4;
}

contract DeepLayers {
  deep: Layer5;

  init() {
    self.deep = Layer5{ l4: Layer4{ l3: Layer3{ l2: Layer2{ l1: Layer1{ foo: 777 } } } } };
  }
}