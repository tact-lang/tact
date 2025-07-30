struct NestedOption {
    innerOpt: Bool?;
}

struct ManyNested {
    opt1: NestedOption?;
    opt2: NestedOption?;
    opt3: NestedOption?;
    opt4: NestedOption?;
}

contract NestedOptionals {
    data: ManyNested;

    init() {
        self.data = ManyNested{
            opt1: null,
            opt2: null,
            opt3: null,
            opt4: null,
        };
    }
}