struct Sub1 {
    a: Int;
    b: Bool;
}

struct Sub2 {
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
}

struct Top {
    s1: Sub1;
    s2: Sub2;
}

contract ComboNestOpt {
    val: Top;
    init() {
        self.val = Top{
            s1: Sub1{a:1, b:true},
            s2: Sub2{c:"hi", d:myAddress(), e:null, f:null}
        };
    }
}