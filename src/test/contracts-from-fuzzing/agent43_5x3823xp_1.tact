struct DeepInner {
    a: Int;
    b: Int?;
}

struct Inner {
    x: DeepInner;
    y: Int?;
}

contract DeepNestedStructHolder {
    s: Inner;

    init() {
        self.s = Inner{
            x: DeepInner{a: 10, b: null},
            y: null
        };
    }
}
