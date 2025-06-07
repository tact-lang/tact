struct NestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool?;
    val: Int;
}

contract TestContract {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{
            inner: InnerStruct{
                flag: null,
                val: 10
            }
        };
    }
}