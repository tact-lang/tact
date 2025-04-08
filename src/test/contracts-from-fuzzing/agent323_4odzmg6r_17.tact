struct Bottom {
    x: Int = 123;
}

struct Middle {
    nest: Bottom;
}

struct Top {
    mid: Middle;
}

contract Test {
    val: Top;

    init() {
        self.val = Top{
            mid: Middle{
                nest: Bottom{},
            },
        };
    }
}