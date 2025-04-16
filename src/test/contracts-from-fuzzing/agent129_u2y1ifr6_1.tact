struct Nested {
    a: Int;
    b: Bool;
    c: String?;
}

contract DeepNestTest {
    info: Nested;

    init() {
        self.info = Nested{
            a: 1,
            b: true,
            c: "hello",
        };
    }
}