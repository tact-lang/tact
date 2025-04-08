struct Base {
    v: Int;
}

struct Mid {
    b: Base;
}

struct Top {
    m: Mid;
}

contract PartiallyAssigned {
    data: Top;

    init() {
        self.data = Top{
            m: Mid{
                b: Base{
                    v: 999
                }
            }
        };
    }
}