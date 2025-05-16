struct DeepInner {
    flag: Bool;
    note: String;
}

struct Middle {
    number: Int;
    inner: DeepInner;
}

contract DeepNestTest {
    s: Middle;

    init() {
        self.s = Middle{
            number: 42,
            inner: DeepInner{ flag: true, note: "deep" }
        };
    }
}
