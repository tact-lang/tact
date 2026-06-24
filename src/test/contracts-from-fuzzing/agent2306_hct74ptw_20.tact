struct AA {
    a: Int;
}

struct BB {
    b: Int;
}

contract MultiStructs {
    aa: AA;
    bb: BB;

    init() {
        self.aa = AA{a:1};
        self.bb = BB{b:2};
    }
}
