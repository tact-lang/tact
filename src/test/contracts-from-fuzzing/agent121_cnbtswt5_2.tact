struct Deep {
    level1: Int;
    level2: Inner;
}

struct Inner {
    sub1: Int;
    sub2: Deeper;
}

struct Deeper {
    field: Int;
}

contract TestContract {
    data: Deep;

    init() {
        self.data = Deep{
            level1: 1,
            level2: Inner{
                sub1: 2,
                sub2: Deeper{ field: 3 }
            }
        };
    }
}
