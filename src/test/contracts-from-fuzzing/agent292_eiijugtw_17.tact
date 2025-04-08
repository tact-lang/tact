struct AStruct {
    a: Int;
}

struct BStruct {
    b: Int;
}

contract MultiNested {
    aa: AStruct;
    bb: BStruct;

    init() {
        self.aa = AStruct{a:1};
        self.bb = BStruct{b:2};
    }
}