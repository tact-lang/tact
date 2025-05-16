struct InnerStruct {
    flag: Bool;
    count: Int;
}

contract NestedStructTest {
    record: InnerStruct;

    init() {
        self.record = InnerStruct{flag: true, count: 42};
    }
}