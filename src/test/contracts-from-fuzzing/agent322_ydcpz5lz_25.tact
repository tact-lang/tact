struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: Slice;
}

struct Both {
    s1: S1;
    s2: S2;
}

contract Test {
    val: Both;

    init() {
        self.val = Both{
            s1: S1{a:1,b:true},
            s2: S2{c:"hi", d: emptyCell().asSlice()},
        };
    }
}