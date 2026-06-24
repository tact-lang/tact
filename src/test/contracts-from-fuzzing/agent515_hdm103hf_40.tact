// Test optional struct deeply nested inside non-optional struct
struct InnerOptStruct {
    val: Int?;
    flag: Bool?;
}

struct Wrap {
    inner: InnerOptStruct?;
    lbl: String;
}

contract DeepNestedOptStruct {
    wrap: Wrap;

    init() {
        self.wrap = Wrap{
            inner: null,
            lbl: "label"
        };
    }
}