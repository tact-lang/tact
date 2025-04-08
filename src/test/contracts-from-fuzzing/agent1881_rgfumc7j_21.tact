struct InnerOpt {
    s: String?;
}

struct OuterStruct {
    inner: InnerOpt?;
    x: Int;
}

contract NestedOptField {
    y: OuterStruct;

    init() {
        self.y = OuterStruct{ inner: null, x: 5 };
    }
}