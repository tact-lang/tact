struct SimpleStruct {
    a: Int;
}

contract ArrayFields {
    e1: SimpleStruct;
    e2: SimpleStruct;
    e3: SimpleStruct;

    init() {
        self.e1 = SimpleStruct{a: 1};
        self.e2 = SimpleStruct{a: 2};
        self.e3 = SimpleStruct{a: 3};
    }
}