struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: String;
    d: S1;
}

contract ChainNested {
    val: S2;
    
    init() {
        self.val = S2{
            c: "hi",
            d: S1{
                a: 77,
                b: false,
            }
        };
    }
}
