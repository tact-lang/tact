struct InnerMost {
    val: Int;
}

struct Middle {
    innerMost: InnerMost;
}

struct Outer {
    optionalMiddle: Middle?;
}

contract TestContract {
    data: Outer;

    init() {
        self.data = Outer{
            optionalMiddle: null,
        };
    }
}