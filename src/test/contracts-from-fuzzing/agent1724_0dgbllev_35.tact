struct Small1 { a:Int; }
struct Small2 { b:Int; }
struct Small3 { c:Int; }
struct Combo {
    s1: Small1;
    s2: Small2;
    s3: Small3;
}

contract ComboFields {
    combo: Combo;
    init() {
        self.combo = Combo{
            s1: Small1{a:1},
            s2: Small2{b:2},
            s3: Small3{c:3}
        };
    }
}