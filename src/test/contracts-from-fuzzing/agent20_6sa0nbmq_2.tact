struct Deep {
    level: Bool;
}

struct Middle {
    deep: Deep;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    count: Int;
}

contract TestContract {
    nested: Outer;

    init() {
        self.nested = Outer{
            middle: Middle{
                deep: Deep{
                    level: true,
                },
                flag: false,
            },
            count: 5,
        };
    }
}
