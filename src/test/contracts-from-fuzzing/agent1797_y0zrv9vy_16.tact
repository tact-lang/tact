struct InlineNested {
    sub: Inner;
}

struct Inner {
    a: Inner2;
}

struct Inner2 {
    x: Int; y: Bool; z: String;
}

contract Test {
    val: InlineNested;
    init() {
        self.val = InlineNested{
            sub: Inner{
                a: Inner2{ x: 1, y: true, z: "abc" }
            }
        };
    }
}