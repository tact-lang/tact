struct InnerMost {
    foo: Int? = null;
    bar: String = "bar";
}

struct Middle {
    a: InnerMost;
    b: Bool? = null;
}

struct Outer {
    m: Middle = Middle{a: InnerMost{}};
    n: Int = 7;
}

contract DefaultsNested {
    s: Outer;

    init() {
        self.s = Outer{};
    }
}