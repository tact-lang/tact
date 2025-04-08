struct Layer3 { i: Int; s: String; }
struct Layer2 { l3: Layer3; flag: Bool; }
struct Layer1 { l2: Layer2; opt: Bool?; }
contract ThreeLayer {
  root: Layer1;
  init() {
    self.root = Layer1{
      l2: Layer2{
        l3: Layer3{ i:5, s:"hi" },
        flag: true
      },
      opt: null
    };
  }
}