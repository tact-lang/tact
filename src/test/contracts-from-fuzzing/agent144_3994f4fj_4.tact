struct OptionalNested {
    innerOpt: Inner?;
}

struct Inner {
    val: Int;
}

contract NestedOptionals {
    data: OptionalNested?;
    init() {
        self.data = OptionalNested{
            innerOpt: Inner{ val: 7 }
        };
    }
}
