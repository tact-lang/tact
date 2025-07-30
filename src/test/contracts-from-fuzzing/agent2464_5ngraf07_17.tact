struct NestedWithOptional {
    sopt: InnerOpt?;
}

struct InnerOpt {
    val: Int;
}

contract OptInNest {
    s: NestedWithOptional;

    init() {
        self.s = NestedWithOptional{
            sopt: null
        };
    }
}
