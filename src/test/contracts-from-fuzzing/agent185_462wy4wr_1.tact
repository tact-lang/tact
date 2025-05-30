struct SimpleStruct {
    value: Int;
}

contract SingleStructHolder {
    data: SimpleStruct;

    init() {
        self.data = SimpleStruct{ value: 42 };
    }
}