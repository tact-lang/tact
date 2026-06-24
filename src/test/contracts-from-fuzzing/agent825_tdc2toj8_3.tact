struct DeepNested {
    i: Int;
    inner: Inner;
}

struct Inner {
    a: Bool;
    message: String;
}

contract DeepNestTest {
    val: DeepNested;

    init() {
        self.val = DeepNested{
            i: 99,
            inner: Inner{
                a: false,
                message: "hello",
            },
        };
    }
}