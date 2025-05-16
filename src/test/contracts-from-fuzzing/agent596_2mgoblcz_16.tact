struct Inner {
    x: Int = 7;
    y: Bool = false;
}

struct NestWithDef {
    inner: Inner = Inner{};
    z: String = "strap";
}

contract NestedInlineDefaultTest {
    data: NestWithDef;

    init() {
        self.data = NestWithDef{};
    }
}