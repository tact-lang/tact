struct NestedOptional {
    inner: Int?;
}

struct OuterOptional {
    innerStruct: NestedOptional?;
    val: Int;
}

contract TestContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{
            innerStruct: null,
            val: 42
        };
    }
}