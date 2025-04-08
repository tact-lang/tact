// deeply nested mixture
struct A { b: B; }
struct B { c: C; flag: Bool; }
struct C { d: D; num: Int; }
struct D { s: String; x: Int?; }

contract DeepMix {
  store: A;
  init() {
    self.store = A{
      b: B{
        c: C{
          d: D{
            s: "deep",
            x: null
          },
          num: 100
        },
        flag: true
      }
    };
  }
}
