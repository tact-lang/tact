struct WithRem {
    a: Int;
    b: Slice as remaining;
}

struct OuterRem {
    x: WithRem;
    y: Int;
}

contract InvalidRem {
    data: OuterRem;

    init() {
        self.data = OuterRem{
            x: WithRem {
                a: 1,
                b: emptyCell().asSlice(),
            },
            y: 2
        };
    }
}
