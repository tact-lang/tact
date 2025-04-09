struct Leaf {
    x: Int?;
    y: Int = 5;
}

struct Mid {
    leaf: Leaf?;
    flag: Bool = false;
}

struct Top {
    m: Mid = Mid{
        leaf: null,
        flag: true,
    };
    num: Int;
}

contract TestContract {
    t: Top;

    init() {
        self.t = Top{
            m: Mid{
                leaf: Leaf{
                    x: null,
                    y: 10,
                },
                flag: false,
            },
            num: 77,
        };
    }
}