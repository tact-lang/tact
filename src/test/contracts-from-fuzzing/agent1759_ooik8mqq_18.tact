struct Maybe {
    a: Int?;
    b: String?;
}

struct HasManyMaybes {
    f1: Maybe;
    f2: Maybe;
    f3: Maybe;
}

contract MultipleNestedNulls {
    s: HasManyMaybes;

    init() {
        self.s = HasManyMaybes{
            f1: Maybe{ a:null, b:null },
            f2: Maybe{ a:null, b:null },
            f3: Maybe{ a:null, b:null },
        };
    }
}
