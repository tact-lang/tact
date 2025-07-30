struct C1 { f1: Int; f2: Bool }
struct C2 { f1: Int; c1: C1 }
struct C3 { f1: Int?; c2: C2 }
struct C4 { f1: String; c3: C3 }

contract Test18 {
  f: C4;
  init() {
    self.f = C4{
      f1: "hi",
      c3: C3{
        f1: null,
        c2: C2{
          f1: 2,
          c1: C1{ f1: 1, f2: false }
        }
      }
    };
  }
}
