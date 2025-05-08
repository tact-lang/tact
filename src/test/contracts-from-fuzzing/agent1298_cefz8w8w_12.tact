struct InnerStruct {
    label: String;
}

struct OuterStruct {
    maybeInner: InnerStruct? = null;
    version: Int = 1;
}

contract OptNestedStructDefaultNull {
    data: OuterStruct?;

    init() {
        self.data = null;
    }
}