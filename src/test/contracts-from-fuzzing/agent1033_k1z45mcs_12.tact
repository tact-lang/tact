struct InnerStruct {
    x: Int = 1;
    y: Bool = true;
}

struct OuterStruct {
    inner: InnerStruct = InnerStruct{};
    s: String = "hello";
}

contract DefaultNested {
    val: OuterStruct;

    init() {
        self.val = OuterStruct{};
    }
}