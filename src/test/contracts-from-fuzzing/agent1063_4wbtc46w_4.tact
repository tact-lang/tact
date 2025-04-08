struct SimpleStruct {
    a: Int;
}

contract TwoFields {
    first: SimpleStruct;
    second: SimpleStruct;

    init() {
        self.first = SimpleStruct{ a: 1 };
        self.second = SimpleStruct{ a: 2 };
    }
}