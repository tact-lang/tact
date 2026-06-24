struct NestedInner {
    a: Int?;
    b: Bool = false;
}

struct HoldsNested {
    x: NestedInner;
    y: Int = 42;
}

contract TestHoldNested {
    data: HoldsNested;

    init() {
        self.data = HoldsNested{
            x: NestedInner{
                a: null,
                b: true
            },
            y: 100
        };
    }
}