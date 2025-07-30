struct Deep {
    a: Int;
}

struct Middle {
    deep: Deep;
}

struct Top {
    mid: Middle;
}

contract Test {
    field: Top;

    init() {
        self.field = Top{
            mid: Middle{
                deep: Deep{a: 1}
            }
        };
    }
}