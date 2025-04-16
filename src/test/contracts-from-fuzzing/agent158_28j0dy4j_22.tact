struct X { x: Int; }
struct Y { y: Int; }
struct Z { z: Int; }

struct Combo {
  a: X; 
  b: Bool;
  c: String;
  d: Y;
  e: Int?;
  f: Z;
  g: Bool?;
}

contract ComboNest {
    big: Combo;
    init() {
        self.big = Combo{
            a: X{ x:1 },
            b: false,
            c: "c",
            d: Y{ y:2 },
            e: 3,
            f: Z{ z:4 },
            g: null
        };
    }
}