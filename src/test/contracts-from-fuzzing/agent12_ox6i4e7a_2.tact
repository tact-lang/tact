struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract NestedStructTest {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            a: null,
            b: true,
            c: "hello",
        };
    }

    receive() {
        self.data = NestedOptional{
            a: 1,
            b: null,
            c: null,
        };
    }
}
