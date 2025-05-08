struct MiddleSerialize {
    a: Int as int64;
    b: Bool;
    c: String;
}

contract MiddleSerializeTest {
    val: MiddleSerialize;

    init() {
        self.val = MiddleSerialize{
            a: -42,
            b: true,
            c: "hello"
        };
    }
}
