struct OptInNested {
    innerOpt: Int?;
}

struct Outer {
    nested: OptInNested?;
}

contract Test {
    data: Outer;

    init() {
        self.data = Outer{
            nested: null,
        };
    }
}
