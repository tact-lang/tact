struct DeepOptional {
    nested: Nested?;
}

struct Nested {
    flag: Bool;
    num: Int;
}

contract OptInMid {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            nested: Nested{ flag: true, num: 77 }
        };
    }
}