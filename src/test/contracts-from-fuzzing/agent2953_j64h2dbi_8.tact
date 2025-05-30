struct InnerMost {
    val: Int;
}

struct Inner {
    im: InnerMost;
    flag: Bool;
}

struct Middle {
    inn: Inner;
}

struct Outer {
    mid: Middle;
}

contract VeryNestedStructs {
    nest: Outer;

    init() {
        self.nest = Outer{
            mid: Middle{
                inn: Inner{
                    im: InnerMost{
                        val: 123
                    },
                    flag: true,
                },
            },
        };
    }
}