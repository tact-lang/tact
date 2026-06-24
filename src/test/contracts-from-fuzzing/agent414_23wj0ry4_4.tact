struct DeeplyOptional {
    innerDeep: InnerOptional?;
    z: Int;
}

struct InnerOptional {
    foo: Int;
    bar: Int;
}

contract NestedOptionalTest {
    nest: DeeplyOptional;

    init() {
        self.nest = DeeplyOptional{
            innerDeep: InnerOptional{ foo: 10, bar: 20 },
            z: 100
        };
    }
}