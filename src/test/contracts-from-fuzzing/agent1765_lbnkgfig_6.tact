struct InnerMost {
    value: Int;
    flag: Bool;
}

struct Mid {
    im1: InnerMost;
    im2: InnerMost;
    im3: InnerMost;
}

struct OuterMost {
    mid1: Mid;
    mid2: Mid;
    mid3: Mid;
}

contract NestedArrayLike {
    data: OuterMost;

    init() {
        self.data = OuterMost{
            mid1: Mid{
                im1: InnerMost{ value: 1, flag: true },
                im2: InnerMost{ value: 2, flag: false },
                im3: InnerMost{ value: 3, flag: true }
            },
            mid2: Mid{
                im1: InnerMost{ value: 4, flag: false },
                im2: InnerMost{ value: 5, flag: true },
                im3: InnerMost{ value: 6, flag: false }
            },
            mid3: Mid{
                im1: InnerMost{ value: 7, flag: true },
                im2: InnerMost{ value: 8, flag: false },
                im3: InnerMost{ value: 9, flag: true }
            }
        };
    }
}