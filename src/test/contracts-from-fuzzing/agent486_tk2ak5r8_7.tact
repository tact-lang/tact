struct OptionalDeepNested {
    inner1: Inner1?;
}

struct Inner1 {
    inner2: Inner2?;
}

struct Inner2 {
    inner3: Inner3?;
}

struct Inner3 {
    value: Int?;
}

contract TestOptionalDeepNested {
    data: OptionalDeepNested;

    init() {
        self.data = OptionalDeepNested{
            inner1: null
        };
    }
}