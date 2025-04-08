struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1a: S1;
    s1b: S1;
}

contract StructTwice {
    val: S2;

    init() {
        self.val = S2{
            s1a: S1{a:1, b:true},
            s1b: S1{a:2, b:false}
        };
    }

    receive() {
        self.val = S2{
            s1a: S1{a:3, b:true},
            s1b: S1{a:4, b:true}
        };
    }
}
