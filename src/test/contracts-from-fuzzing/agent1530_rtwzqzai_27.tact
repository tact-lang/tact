struct InnerMost {
    a: Int = 123;
    b: Bool = true;
}

struct MidLevel {
    x: InnerMost? = null;
    y: String? = null;
}

struct Outer {
    middle: MidLevel? = null;
}

contract TestContract {
    thing: Outer;

    init() {
        self.thing = Outer{};
    }
}
