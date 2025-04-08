struct SubStruct1 {
    aa: Int;
}

struct SubStruct2 {
    bb: Int;
}

struct SubStruct3 {
    cc: Int;
}

struct TopStruct {
    f1: SubStruct1;
    f2: SubStruct2;
    f3: SubStruct3;
}

contract ManyNestedTypes {
    storage: TopStruct;

    init() {
        self.storage = TopStruct{
            f1: SubStruct1{ aa: 1 },
            f2: SubStruct2{ bb: 2 },
            f3: SubStruct3{ cc: 3 },
        };
    }
}