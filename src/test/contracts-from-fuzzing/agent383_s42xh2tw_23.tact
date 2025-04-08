struct Inner {
   iv: Int;
}

struct Middle {
   mv: Bool;
   sub: Inner;
}

struct Outer {
   ov: Int;
   nested: Middle;
}

contract TripleNest {
    s: Outer;
    init() {
        self.s = Outer{
            ov: 7,
            nested: Middle{
               mv: true,
               sub: Inner{ iv: 99 }
            }
        };
    }
}