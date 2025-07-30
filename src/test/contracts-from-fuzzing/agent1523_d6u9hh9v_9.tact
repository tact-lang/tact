struct BottomMost {
    z: Int;
}

struct Middle {
    y: BottomMost;
}

struct Top {
    x: Middle;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            x: Middle{
                y: BottomMost{
                    z: 999,
                },
            },
        };
    }
}