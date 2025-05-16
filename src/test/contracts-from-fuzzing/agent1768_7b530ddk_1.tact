struct NestedOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    value: Int?;
}

contract TestStorage {
    data: NestedOptional;

    init() {
        self.data = NestedOptional{ inner: null };
    }
}