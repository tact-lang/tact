struct NestedOptional {
    optInner: Inner?;
    val: Int;
}

struct Inner {
    optVal: Int?;
}

contract ComplexOptionalTest {
    nestedOpt: NestedOptional;

    init() {
        self.nestedOpt = NestedOptional{
            optInner: null,
            val: 777,
        };
    }
}