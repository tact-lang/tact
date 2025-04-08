struct A {
    x: Int;
    opt: Int?;
}

message(0x42) B {
    a: A;
}

contract MessageAsField {
    mfield: B;

    init() {
        self.mfield = B{a: A{x:5, opt:null}};
    }
}