struct OptNest {
    child: Child?;
}

struct Child {
    foo: Bool;
    bar: Int?;
}

contract OptionalsNested {
    s: OptNest;

    init() {
        self.s = OptNest{
            child: Child{
                foo: true,
                bar: 55,
            },
        };
    }
}
