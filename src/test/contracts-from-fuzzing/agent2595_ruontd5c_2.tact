struct Nested {
    nestedFlag: Bool;
    nestedNumber: Int as uint32;
}

contract HasNestedStruct {
    data: Nested;

    init() {
        self.data = Nested{nestedFlag: false, nestedNumber: 123};
    }
}