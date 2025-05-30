struct IntStruct {
    f1: Int as int8;
    f2: Int as int64;
    f3: Int as int257;
}

contract Test {
    s: IntStruct;
    init() {
        self.s = IntStruct{ f1: 1, f2: 2, f3: 3 };
    }
}