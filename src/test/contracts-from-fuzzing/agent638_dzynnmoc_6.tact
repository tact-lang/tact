struct Sub {
    v: Int as uint8;
    b: Bool = false;
}

struct Holder {
    s1: Sub?;
    s2: Sub? = null;
    s3: Sub? = null;
}

contract DefaultsNestedOptional {
    h: Holder = Holder{
        s1: null,
        s2: null,
        s3: null,
    };

    init() {
        self.h = Holder{
            s1: Sub{ v: 1, b: true },
            s2: null,
            s3: Sub{ v: 2, b: false },
        };
    }
}