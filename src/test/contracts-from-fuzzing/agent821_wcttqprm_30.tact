// test nested struct with optional builder
struct BuilderOptWrap {
    b: Builder?;
}

contract TestOptBuilderNested {
    val: BuilderOptWrap = BuilderOptWrap{b: null};

    init() {
        self.val = BuilderOptWrap{b: beginCell().storeUint(1,1)};
    }
}
