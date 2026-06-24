struct A { one: Int }
struct B { two: Int }
struct C { three: Int }
struct D { four: Int }

struct Combo {
  a: A;
  b: B;
  c: C;
  d: D;
}

contract TestContract {
    combo: Combo;
    init() {
        self.combo = Combo{
            a: A{one: 1},
            b: B{two: 2},
            c: C{three: 3},
            d: D{four: 4},
        };
    }
}