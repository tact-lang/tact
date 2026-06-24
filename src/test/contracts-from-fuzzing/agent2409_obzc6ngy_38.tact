struct SubStruct {
    a: Int;
    b: Bool;
}

contract TopContract {
    x: Int;
    s: SubStruct;
    flag: Bool;

    init() {
        self.x = 22;
        self.s = SubStruct{ a: 6, b: false };
        self.flag = true;
    }
}