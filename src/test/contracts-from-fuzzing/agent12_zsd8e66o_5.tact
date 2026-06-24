struct Inner {
    x: Int = 7;
}

struct Outer {
    i: Int = 1;
    inr: Inner?; // optional nested struct, defaults null
}

contract TestContract {
    outer: Outer = Outer{};

    init() {
        self.outer = Outer{
            i: 2,
            inr: Inner{x: 42}
        };
    }
}