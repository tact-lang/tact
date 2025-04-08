struct Nested {
    inner: Inner;
}

struct Inner {
    flag: Bool;
    count: Int as uint8;
    text: String;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{
            inner: Inner{
                flag: true,
                count: 1,
                text: "hi",
            }
        };
    }
}