struct NestOpt1 {
    a: Int?;
    b: Bool;
}

struct NestOpt2 {
    inner: NestOpt1?;
    text: String;
}

contract OptionalNestedStructTest {
    data: NestOpt2;

    init() {
        self.data = NestOpt2{
            inner: null,
            text: "Hello",
        };
    }
}