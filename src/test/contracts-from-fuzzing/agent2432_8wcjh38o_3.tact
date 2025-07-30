struct DeepNested {
    inner: Inner;
    extra: String;
}

struct Inner {
    flag: Bool;
    number: Int;
    text: String;
}

contract Test {
    nested: DeepNested;
    init() {
        self.nested = DeepNested{
            inner: Inner{flag: false, number: -1, text: "deep"},
            extra: "hello"
        };
    }
}