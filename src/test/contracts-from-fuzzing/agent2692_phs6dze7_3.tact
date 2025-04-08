struct InnerNested {
    a: Int;
    b: String?;
    c: Bool;
}

struct OuterStruct {
    arr0: Int;
    arr1: InnerNested;
    arr2: Int;
}

contract OptNestedField {
    data: OuterStruct?;

    init() {
        self.data = null;
    }
}
