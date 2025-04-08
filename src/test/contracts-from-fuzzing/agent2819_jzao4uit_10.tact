struct Inner {
    a: Int = 1;
    b: Bool = false;
}

struct Outer {
    x: Int?;
    y: Inner;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            x: null,
            y: Inner{}
        };
    }
}