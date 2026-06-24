struct SimpleStruct {
    x: Int;
}

contract StructFieldInit {
    s: SimpleStruct;

    init() {
        self.s = SimpleStruct { x: 123 };
    }
}