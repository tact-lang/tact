struct NestedOptionals {
    innerOpt: Int?;
    strOpt: String?;
}

struct Wrapper {
    w1: NestedOptionals?;
    w2: Bool;
}

contract Test6 {
    val: Wrapper;

    init() {
        self.val = Wrapper{
            w1: NestedOptionals{
                innerOpt: null,
                strOpt: "maybe"
            },
            w2: true
        };
    }
}