struct NestedOptional {
    inner: Int?;
}

struct OuterOptional {
    innerStruct: NestedOptional?;
}

contract NullableContainer {
    big: OuterOptional;

    init() {
        self.big = OuterOptional{
            innerStruct: null
        };
    }
}
