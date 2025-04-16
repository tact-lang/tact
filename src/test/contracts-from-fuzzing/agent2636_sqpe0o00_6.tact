struct BasicStruct {
    a: Int;
}

contract ManyStructRefs {
    x1: BasicStruct;
    x2: BasicStruct;
    x3: BasicStruct;
    x4: BasicStruct;
    x5: BasicStruct;
    x6: BasicStruct;

    init() {
        let s = BasicStruct{ a: 42 };
        self.x1 = s; self.x2 = s; self.x3 = s;
        self.x4 = s; self.x5 = s; self.x6 = s;
    }
}