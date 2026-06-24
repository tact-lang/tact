struct Leaf {
    value: Int;
    optionalFlag: Bool?;
}

struct Middle {
    one: Leaf;
    two: Leaf;
}

struct Top {
    m1: Middle;
    m2: Middle;
}

contract TestContract {
    storage: Top;

    init() {
        self.storage = Top{
            m1: Middle{
                one: Leaf{ value: 1, optionalFlag: null },
                two: Leaf{ value: 2, optionalFlag: false }
            },
            m2: Middle{
                one: Leaf{ value: 3, optionalFlag: true },
                two: Leaf{ value: 4, optionalFlag: null }
            }
        };
    }
}