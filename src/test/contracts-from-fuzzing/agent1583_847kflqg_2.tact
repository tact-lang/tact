struct Deep {
    inner1: Int;
    inner2: Int;
    inner3: Int;
    inner4: Int;
}

struct Middle {
    deep: Deep;
    flag: Bool;
}

struct Outer {
    middle: Middle;
    number: Int;
}

contract DeepNest {
    storage: Outer;

    init() {
        self.storage = Outer{
            middle: Middle{
                deep: Deep{
                    inner1: 1,
                    inner2: 2,
                    inner3: 3,
                    inner4: 4,
                },
                flag: true,
            },
            number: 10,
        };
    }
}