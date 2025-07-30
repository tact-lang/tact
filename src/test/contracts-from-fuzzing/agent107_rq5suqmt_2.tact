struct DeepInner {
    flag: Bool;
}

struct Inner {
    nested: DeepInner;
    num: Int;
    txt: String;
}

contract DeepNestTest {
    data: Inner;
    init() {
        self.data = Inner{
            nested: DeepInner{ flag: true },
            num: 7,
            txt: "hi"
        };
    }
}