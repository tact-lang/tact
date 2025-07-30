struct InnerStruct { a: Int; b: Bool; c: Address; }

contract TestNestedStruct {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{ a: 1, b: true, c: myAddress() };
    }
}