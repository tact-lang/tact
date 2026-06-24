struct Nested {
    str: String;
    flag: Bool;
    optNum: Int?;
}

contract TestNestedStorage {
    record: Nested;

    init() {
        self.record = Nested{
            str: "hello",
            flag: true,
            optNum: null,
        };
    }
}