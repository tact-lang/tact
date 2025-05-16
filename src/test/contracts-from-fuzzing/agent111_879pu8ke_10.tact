struct Inner {
    x: Int;
}

struct Outer {
    nested: Inner?;
    y: Bool;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null,
            y: false
        };
    }
}
