struct NestedOptionalStruct {
    a: Int?;
    b: String?;
}

struct HoldsOptional {
    inner: NestedOptionalStruct;
}

contract OptionalInNestedStruct {
    val: HoldsOptional;

    init() {
        self.val = HoldsOptional{
            inner: NestedOptionalStruct{ a:null, b:null }
        };
    }
}