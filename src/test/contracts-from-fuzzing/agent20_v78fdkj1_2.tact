struct NestedStruct {
    a: Int;
    b: Bool;
}

contract WithNested {
    data: NestedStruct = NestedStruct{a: 0, b: false};

    receive() {
        self.data = NestedStruct{a: 42, b: true};
    }
}