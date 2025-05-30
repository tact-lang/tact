struct InnerStruct {
    data: String;
}

struct OuterStruct {
    inner: InnerStruct;
}

contract StructSwap {
    saved: OuterStruct;

    init() {
        self.saved = OuterStruct{ inner: InnerStruct{ data: "hello" } };
    }
}
