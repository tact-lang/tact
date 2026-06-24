struct Inner {
    x: Int?;
}

struct Outer {
    nested: Inner?;
}

contract TestContract {
    s: Outer;

    init() {
        self.s = Outer{
            nested: Inner{
                x: null
            }
        };
    }
}
