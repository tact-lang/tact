struct BigNest {
    l1: Int;
    l2: Struct2;
}
struct Struct2 {
    l1: Int;
    l2: Struct3;
}
struct Struct3 {
    l1: Int;
    l2: Struct4;
}
struct Struct4 {
    l1: Int;
    l2: Struct5;
}
struct Struct5 {
    l1: Int;
    l2: Struct6;
}
struct Struct6 {
    l1: Int;
    l2: Struct7;
}
struct Struct7 {
    l1: Int;
}

contract Deepest {
    field: BigNest;

    init() {
        self.field = BigNest{
            l1: 0,
            l2: Struct2{
                l1: 1,
                l2: Struct3{
                    l1: 2,
                    l2: Struct4{
                        l1: 3,
                        l2: Struct5{
                            l1: 4,
                            l2: Struct6{
                                l1: 5,
                                l2: Struct7{
                                    l1: 6
                                }
                            }
                        }
                    }
                }
            }
        };
    }
}
