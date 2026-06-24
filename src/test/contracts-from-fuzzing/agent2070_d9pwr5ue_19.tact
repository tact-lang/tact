struct DeepOpts {
    level1: Int?;
    level2: NestedO?;
}

struct NestedO {
    foo: Int?;
    bar: Bool?;
}

contract DeepOptionals {
    d: DeepOpts;

    init() {
        self.d = DeepOpts{
            level1: null,
            level2: NestedO{
                foo: null,
                bar: true
            }
        };
    }
}