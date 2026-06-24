struct S {
    nested: Deep?;
}

struct Deep {
    flag: Bool = false;
    value: Int?;
}

contract NestedOptional {
    s: S = S{};

    init() {
        self.s = S{
            nested: Deep{
                flag: true,
                value: 999
            }
        };
    }
}