struct InnerS {
    val: Int;
}

struct Top {
    opt: InnerS?;
}

contract OptNested {
    st: Top;

    init() {
        self.st = Top{
            opt: null
        };
    }
}
