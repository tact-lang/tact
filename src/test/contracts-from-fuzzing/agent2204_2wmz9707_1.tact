struct Inner {
    val: Int;
    active: Bool;
}

struct MidLevel {
    inner: Inner;
    number: Int;
    text: String;
}

contract DeepNested {
    stored: MidLevel;
    init() {
        self.stored = MidLevel{
            inner: Inner{ val: 5, active: true },
            number: 10,
            text: "test"
        };
    }
}