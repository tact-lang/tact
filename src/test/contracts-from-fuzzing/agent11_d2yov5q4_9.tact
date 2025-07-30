struct NestedOptionals {
    innerOpt: Int?;
    nestedOpt: Bool?;
}

struct OuterOpt {
    a: NestedOptionals?;
    b: Int;
}

contract OptInOpt {
    val: OuterOpt;

    init() {
        self.val = OuterOpt{
            a: null,
            b: 777,
        };
    }
}