struct EmbeddedOpt {
    a: Int?;
    b: Bool?;
}

struct Top {
    innerOpt: EmbeddedOpt?;
    flag: Bool;
}

contract NestedOptionalOpt {
    top: Top;

    init() {
        self.top = Top{
            innerOpt: null,
            flag: true,
        };
    }

    receive() {
        self.top = self.top;
    }
}