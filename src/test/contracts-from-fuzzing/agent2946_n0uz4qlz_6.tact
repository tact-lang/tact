struct InnerOpt {
    a: Int?;
    b: Bool?;
}

struct OuterOpt {
    innerOpt: InnerOpt?;
    c: Int;
}

contract NestedOptionals {
    val: OuterOpt;
    init() {
        self.val = OuterOpt{
            innerOpt: null,
            c: 5
        };
    }
}