struct SimpleStruct {
    value: Int;
}

contract TestContract {
    myStruct: SimpleStruct = SimpleStruct{value: 123};

    init() {
        self.myStruct = SimpleStruct{value: 456};
    }
}