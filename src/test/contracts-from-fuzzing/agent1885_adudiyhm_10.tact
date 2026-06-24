struct LeftRight {
    left: Int;
    right: Int;
}

struct Container {
    l: LeftRight?;
    r: LeftRight?;
}

contract OptionalPairs {
    data: Container;

    init() {
        self.data = Container{
            l: LeftRight{
                left: 1,
                right: 2
            },
            r: null
        };
    }
}