struct LongNest1 {
    f: LongNest2;
}

struct LongNest2 {
    f: LongNest3;
}

struct LongNest3 {
    f: LongNest4;
}

struct LongNest4 {
    f: LongNest5;
}

struct LongNest5 {
    f: Int;
}

contract LongNested {
    s: LongNest1;

    init() {
        self.s = LongNest1{
            f: LongNest2{
                f: LongNest3{
                    f: LongNest4{
                        f: LongNest5{
                            f: 55
                        }
                    }
                }
            }
        };
    }
}