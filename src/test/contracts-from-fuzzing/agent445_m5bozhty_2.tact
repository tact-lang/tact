struct Nested {
    a: Int;
    b: Bool;
    c: String?;
}

contract DeepStorage {
    obj: Nested;
    init() {
        self.obj = Nested{
            a: 42,
            b: true,
            c: "hello"
        };
    }
}