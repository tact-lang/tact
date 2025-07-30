struct Layer1 { a: Int; }
struct Layer2 { l1: Layer1; }
struct Layer3 { l2: Layer2; }
struct Layer4 { l3: Layer3; }
struct Layer5 { l4: Layer4; }
struct Layer6 { l5: Layer5; }

contract TestContract {
  deepNest: Layer6;

  init() {
    self.deepNest = Layer6{ l5: Layer5{ l4: Layer4{ l3: Layer3{ l2: Layer2{ l1: Layer1{ a: 99 }}}}}};
  }
}