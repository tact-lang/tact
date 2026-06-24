struct InnerStruct {
    a: Int;
    b: Int?;
    c: Bool;
}

contract NestedStructTest {
    data: InnerStruct;

    init() {
        self.data = InnerStruct{a: 1, b: null, c: true};
    }
}