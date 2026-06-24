struct NestedOptional {
    flag: Bool?;
    count: Int?;
    inner: InnerStruct?;
}

struct InnerStruct {
    status: Bool;
    value: Int;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            flag: null,
            count: null,
            inner: null,
        };
    }
}