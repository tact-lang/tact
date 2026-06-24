struct OptionInNest {
    val: Int?;
}

struct OuterOptNest {
    inner: OptionInNest?;
}

contract OptionalNestedStruct {
    data: OuterOptNest;

    init() {
        self.data = OuterOptNest{inner: null};
    }
}