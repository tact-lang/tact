struct InnerStruct {
    a: Int;
    b: Bool?;
}

contract Test {
    complex: InnerStruct;

    init() {
        self.complex = InnerStruct { a: 10, b: null };
    }

    receive() {
        self.complex = InnerStruct { a: self.complex.a + 1, b: true };
    }
}