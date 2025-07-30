struct DeepNested {
    val: Int;
    inner: Inner;
}

struct Inner {
    flag: Bool;
    str: String;
}

contract Test {
    state: DeepNested;

    init() {
        self.state = DeepNested{
            val: 5,
            inner: Inner{
                flag: true,
                str: "abc",
            },
        };
    }
}