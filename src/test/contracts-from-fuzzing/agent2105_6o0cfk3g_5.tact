struct NestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int?;
    y: Bool;
}

contract TestContract {
    s: NestedOptional;

    init() {
        self.s = NestedOptional{
            inner: InnerStruct{
                x: null,
                y: true,
            }
        };
    }
}