// Mix nested structs, optionals, and default values
struct Bottom {
    v: Int = 0;
}

struct Middle {
    v: Int?;
    btm: Bottom;
}

struct Top {
    m1: Middle;
    m2: Middle?;
}

contract MixedNestedDefaults {
    data: Top = Top{
        m1: Middle{ v: 5, btm: Bottom{} },
        m2: null,
    };

    init() {
        self.data = Top{
            m1: Middle{ v: null, btm: Bottom{ v: 42 } },
            m2: Middle{ v: 7, btm: Bottom{} },
        };
    }
}