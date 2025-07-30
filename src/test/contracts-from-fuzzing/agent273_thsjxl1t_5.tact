struct NestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Bool;
}

contract Test5 {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ inner: null };
    }
}