struct InnerMost {
    a: Int;
    b: String?;
}

struct Mid {
    c: InnerMost?;
}

struct Outer {
    flag: Bool;
    d: Mid?;
}

contract TestContract {
    data: Outer;
    init() {
        self.data = Outer{
            flag: false,
            d: null
        };
    }
}