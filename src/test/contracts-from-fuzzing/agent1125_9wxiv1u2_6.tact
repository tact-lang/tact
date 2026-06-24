struct InnerA { a: Int }
struct InnerB { b: Bool }
struct InnerC { c: Address }

struct Mid1 { x: InnerA; y: InnerB }
struct Mid2 { z: InnerC; w: Int }

struct Top {
  left: Mid1;
  right: Mid2;
}

contract DeepWide {
  data: Top;
  init() {
    self.data = Top{
      left: Mid1{ x: InnerA{ a: 42 }, y: InnerB{ b: true } },
      right: Mid2{ z: InnerC{ c: myAddress() }, w: 7 }
    };
  }
}