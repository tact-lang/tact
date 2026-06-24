struct Nested {
    inner: Int as int64;
    flag: Bool;
}

contract NestedStruct {
    data: Nested;

    init() {
        self.data = Nested{
            inner: 123,
            flag: true,
        };
    }
}