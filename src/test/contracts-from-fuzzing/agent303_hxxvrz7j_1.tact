struct NestedOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
    number: Int;
}

contract TestStorage {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{ inner: null };
    }
}