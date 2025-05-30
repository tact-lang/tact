struct AStruct {
    num: Int as uint32;
}

struct BStruct {
    flag: Bool;
    inner: AStruct;
}

contract Test38 {
    d: BStruct;

    init() {
        self.d = BStruct { flag: true, inner: AStruct{ num:17 } };
    }
}