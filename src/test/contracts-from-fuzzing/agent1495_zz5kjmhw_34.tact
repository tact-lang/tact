struct Sub1 { a: Int; }
struct Sub2 { b: Bool; }
struct Sub3 { c: String; }

struct Combo {
    s1: Sub1;
    s2: Sub2;
    s3: Sub3;
}

contract NestedMulti {
    combo: Combo;

    init() {
        self.combo = Combo{
            s1: Sub1{a: 1},
            s2: Sub2{b: true},
            s3: Sub3{c: "s"}
        };
    }
}
