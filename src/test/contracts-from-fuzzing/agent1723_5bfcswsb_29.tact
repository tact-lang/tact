struct Rec1 { v: Int }
struct Rec2 { r1: Rec1 }
struct Rec3 { r2: Rec2 }
struct Rec4 { r3: Rec3 }
struct Rec5 { r4: Rec4 }
struct Rec6 { r5: Rec5 }

contract DeepChain {
  root: Rec6;

  init() {
    self.root = Rec6{ r5: Rec5{ r4: Rec4{ r3: Rec3{ r2: Rec2{ r1: Rec1{ v:777 }}}}}};
  }
}