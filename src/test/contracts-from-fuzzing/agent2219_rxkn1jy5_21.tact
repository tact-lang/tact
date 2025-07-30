struct A { x: Int; y: String; }
struct B { q: String; p: Int; }

struct Combo {
  f1: A;
  f2: B;
  f3: Int;
  f4: Bool;
  f5: String;
}

contract ComboStruct {
    val: Combo;

    init() {
        self.val = Combo{
            f1: A{ x:1, y:"yy" },
            f2: B{ q:"qq", p:2 },
            f3:3,
            f4:true,
            f5:"str"
        };
    }
}