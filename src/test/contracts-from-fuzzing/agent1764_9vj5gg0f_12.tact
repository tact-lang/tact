struct Inner {
    x: Int = 10;
    y: Bool = false;
}

struct Outer {
    inn: Inner;
    label: String = "outer";
}

contract TestContract {
    composed: Outer;
    init() {
        self.composed = Outer{
            inn: Inner{ y: true },
            label: "changed"
        };
    }
}
