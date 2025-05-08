struct InnerMost {
    a: Int?;
    b: String = "ok";
}

struct Mid {
    x: InnerMost;
}

struct Outer {
    m: Mid;
}

contract TestContract {
    store: Outer;

    init() {
        self.store = Outer{ m: Mid{ x: InnerMost{} } };
    }
}