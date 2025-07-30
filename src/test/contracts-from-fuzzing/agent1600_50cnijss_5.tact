struct Leaf {
    x: Int;
}

struct Mid {
    leaf: Leaf?;
    y: Bool;
}

struct Top {
    mid: Mid;
    flag: Bool;
}

contract TestContract {
    data: Top;

    init() {
        self.data = Top{
            mid: Mid{
                leaf: Leaf{ x: 123 },
                y: true
            },
            flag: false
        };
    }
}