struct DeepNested {
    a: Int;
    b: Bool?;
    c: Inner;
}

struct Inner {
    s: String;
    t: Bool;
}

contract DeepTest {
    val: DeepNested = DeepNested{ a: 5, b: null, c: Inner{ s: "hi", t: true } };

    init() {
        self.val = DeepNested{ a: 10, b: false, c: Inner{ s: "hello", t: false } };
    }
}