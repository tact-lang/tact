struct OptionalNest {
    flag: Bool?;
    count: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptionalNestedContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            flag: null,
            count: null,
            inner: null,
        };
    }
}