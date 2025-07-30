struct Nested {
    inner: Int;
    flag: Bool;
    text: String;
    maybe: Cell?;
    nestedOpt: Int?;
}

contract DeepTest {
    data: Nested;

    init() {
        self.data = Nested{
            inner: 42,
            flag: true,
            text: "hi",
            maybe: null,
            nestedOpt: null
        };
    }
}