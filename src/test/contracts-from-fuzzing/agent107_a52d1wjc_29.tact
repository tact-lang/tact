struct DeepOpt {
    foo: Int?;
}

struct NestedDeepOpt {
    bar: DeepOpt?;
}

struct NestedMore {
    deeper: NestedDeepOpt?;
}

contract VeryNestedOptional {
    nest: NestedMore;

    init() {
        self.nest = NestedMore{
            deeper: null
        };
    }
}