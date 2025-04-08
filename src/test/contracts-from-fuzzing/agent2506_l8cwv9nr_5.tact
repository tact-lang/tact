struct OptionalLayer2 {
    innerOpt: Int?;
}

struct OptionalLayer1 {
    optStruct: OptionalLayer2?;
}

struct WrapperOpt {
    nested: OptionalLayer1;
}

contract NestedOptionalStructTest {
    data: WrapperOpt;

    init() {
        self.data = WrapperOpt{
            nested: OptionalLayer1{
                optStruct: null,
            }
        };
    }
}
