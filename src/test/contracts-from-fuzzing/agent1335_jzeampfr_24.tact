struct Bottom {
    x: Int;
}
struct MiddlePlus {
    left: Bottom;
    right: Bottom;
}
struct TopBig {
    mid1: MiddlePlus;
    mid2: MiddlePlus;
}

contract TreeShape {
    data: TopBig;

    init() {
        self.data = TopBig{
            mid1: MiddlePlus{
                left: Bottom{ x: 1 }, right: Bottom{ x: 2 }
            },
            mid2: MiddlePlus{
                left: Bottom{ x: 3 }, right: Bottom{ x: 4 }
            }
        };
    }
}