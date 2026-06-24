struct OptionalNested {
    innerOpt: Int?;
}

struct WrapOptional {
    nestedOpt: OptionalNested?;
    val: Int;
}

contract OptionalNestedContract {
    data: WrapOptional;

    init() {
        self.data = WrapOptional{
            nestedOpt: null,
            val: 42
        };
    }
}