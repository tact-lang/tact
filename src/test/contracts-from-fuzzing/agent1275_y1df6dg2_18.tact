struct NestedDefaults {
    flag: Bool = false;
    inner: Int = 99;
}

struct WrapDef {
    a: NestedDefaults;
    b: NestedDefaults = NestedDefaults{};
}

contract ContractNestedDefaults {
    data: WrapDef;

    init() {
        self.data = WrapDef{
            a: NestedDefaults{flag:true, inner:123},
        };
    }
}