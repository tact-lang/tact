contract DeepOptionalNestedTest {
    s: OuterStruct;

    init() {
        self.s = OuterStruct{
            nested: InnerStruct{
                val: null
            }
        };
    }
}

struct OuterStruct {
    nested: InnerStruct;
}

struct InnerStruct {
    val: String?; // optional primitive, inside nested struct
}
