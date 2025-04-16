struct Inner {
    foo: Int = 17;
    bar: Bool = false;
}

struct Outer {
    innerOpt: Inner? = Inner{ foo: 100, bar: true };
}

contract OptionalWithDefaultStruct {
    data: Outer;

    init() {
        self.data = Outer{};
    }
}