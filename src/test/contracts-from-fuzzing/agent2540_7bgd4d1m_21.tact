struct NestedOptOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    s: String?;
    b: Bool?;
}

contract DeepOptContract {
    data: NestedOptOptional;

    init() {
        self.data = NestedOptOptional{
            inner: InnerStruct{
                s: null,
                b: null
            }
        };
    }
}