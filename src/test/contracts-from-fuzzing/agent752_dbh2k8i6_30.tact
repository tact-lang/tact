struct Layer4 { val: Int; }
struct Layer3 { next: Layer4; }
struct Layer2 { next: Layer3; }
struct Layer1 { next: Layer2; }

contract DeepStorage {
  l1: Layer1;
  init() {
    self.l1 = Layer1{ next: Layer2{ next: Layer3{ next: Layer4{ val: 1337 }}}};
  }
}