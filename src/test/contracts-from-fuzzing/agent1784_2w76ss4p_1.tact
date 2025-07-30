struct Nested {
    inner: InnerStruct;
}

struct InnerStruct {
    flag: Bool;
    count: Int;
}

contract DeepNestedTest {
    record: Nested;

    init() {
        self.record = Nested{inner: InnerStruct{flag: true, count: 123}};
    }
}