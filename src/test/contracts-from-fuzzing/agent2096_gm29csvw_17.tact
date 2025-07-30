struct OptInt {
    oi: Int?;
}

struct WrapOptInt {
    inner: OptInt;
}

contract NestedOptionalStruct {
    value: WrapOptInt;

    init() {
        self.value = WrapOptInt{ inner: OptInt{ oi: null } };
    }
}