struct DeepOptionalNest {
    inner: Int?;
    name: String;
}

struct MiddleOptionalNest {
    d: DeepOptionalNest?;
    x: Int;
}

contract DeepNestedOptionalStruct {
    st: MiddleOptionalNest;

    init() {
        self.st = MiddleOptionalNest{
            d: DeepOptionalNest{ inner: null, name:"yo" },
            x: 5
        };
    }
}
