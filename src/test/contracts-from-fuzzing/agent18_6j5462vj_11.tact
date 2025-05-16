struct Rec1 { next: Rec2? }
struct Rec2 { next: Rec3? }
struct Rec3 { val: Int }

contract Recurse {
  field: Rec1;

  init() {
    self.field = Rec1{ next: Rec2{ next: Rec3{ val: 42 } } };
  }
}