struct OptNested {
    value: Inner?;
}

struct Inner {
    content: Deepest?;
}

struct Deepest {
    data: Int;
}

contract OptionalDeep {
    opt: OptNested;
    init() {
        self.opt = OptNested{
            value: Inner{
                content: Deepest{
                    data: 42
                }
            }
        };
    }
}