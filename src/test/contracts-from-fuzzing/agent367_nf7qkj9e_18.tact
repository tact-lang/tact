struct NestedOptional {
    first: Int?;
    second: Inner?;
}

struct Inner {
    innerVal: Int?;
}

contract OptStruct {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            first: null,
            second: Inner{
                innerVal: null
            }
        };
    }
}