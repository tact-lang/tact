struct NestedOptional {
    number: Int?;
    nested: Inner?;
}

struct Inner {
    flag: Bool;
}

contract NestedStructOpt {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            number: null,
            nested: null,
        };
    }
}