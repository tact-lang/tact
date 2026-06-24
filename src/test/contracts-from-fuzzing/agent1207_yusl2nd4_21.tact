struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: Bool;
    d: Int;
}

contract CrossStruct {
    x: S1;
    y: S2;

    init() {
        self.x = S1{a:1, b:true};
        self.y = S2{c:false, d:2};
    }
}