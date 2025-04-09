// test contract with nested wrapping
struct Layer1 { v: Int; }
struct Layer2 { v: Layer1; }
struct Layer3 { v: Layer2; }
struct Layer4 { v: Layer3; }
struct Layer5 { v: Layer4; }

contract Test {
  store: Layer5;
  init() {
    self.store = Layer5{v: Layer4{v: Layer3{v: Layer2{v: Layer1{v:10}}}}};
  }
}