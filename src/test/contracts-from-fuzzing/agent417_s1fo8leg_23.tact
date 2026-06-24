struct Inner {
    x: Int?;
    y: Bool?;
}

struct Outer {
    i1: Inner?;
    i2: Inner?;
}

contract TestContract {
    nestnulls: Outer;

    init() {
        self.nestnulls = Outer{
            i1: null,
            i2: Inner{
                x: null,
                y: null
            }
        };
    }
}