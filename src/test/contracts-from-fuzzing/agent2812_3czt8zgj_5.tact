struct InnerMost {
    val: Int;
    flag: Bool;
}

struct InnerOptional {
    nested: InnerMost?;
    x: Int;
}

struct Middle {
    innerOpt: InnerOptional;
    y: Bool;
}

contract OptionalDeep {
    data: Middle;

    init() {
        self.data = Middle{
            innerOpt: InnerOptional{
                nested: null,
                x: 777
            },
            y: true
        };
    }
}