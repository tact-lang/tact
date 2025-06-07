struct OptionalSub {
    val: Int;
}

struct OptionalMid {
    sub: OptionalSub?;
}

contract ContractWithOptionalNested {
    data: OptionalMid;
    init() {
        self.data = OptionalMid{ sub: null };
    }
}
