struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

struct S4 {
    d: S3;
}

contract MultiLevelStruct {
    val: S4;
    
    init() {
        self.val = S4{d: S3{c: S2{b: S1{a: 777}}}};
    }
    
    receive() {
        self.val = S4{d: S3{c: S2{b: S1{a: 888}}}};
    }
}