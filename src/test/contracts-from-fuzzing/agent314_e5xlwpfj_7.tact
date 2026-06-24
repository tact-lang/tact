struct InnerWithDefaults {
    x: Int = 10;
    y: Bool = true;
}

struct Outer {
    inner: InnerWithDefaults;
    number: Int;
}

contract TestContract {
    f: Outer;

    init() {
        self.f = Outer{
            number: 7,
            inner: InnerWithDefaults{}
        };
    }
}