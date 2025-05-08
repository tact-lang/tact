struct Mid {
    x: Int;
}

struct Container {
    mid1: Mid;
    mid2: Mid;
}

contract SameStructTwice {
    d: Container;

    init() {
        self.d = Container{
            mid1: Mid{ x:1 },
            mid2: Mid{ x:2 },
        };
    }
}
