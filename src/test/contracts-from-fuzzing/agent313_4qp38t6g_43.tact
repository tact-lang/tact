struct NestedBoolOptional {
    flag: Bool?;
}

struct WrapBoolOptional {
    inner: NestedBoolOptional?;
}

contract WrapBoolOptionalContract {
    data: WrapBoolOptional;

    init() {
        self.data = WrapBoolOptional{inner: NestedBoolOptional{flag:true}};
    }
}