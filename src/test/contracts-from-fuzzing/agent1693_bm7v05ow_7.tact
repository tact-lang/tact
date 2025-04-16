struct OptionalComposite {
    s: String?;
    addr: Address?;
    n: Int?;
    b: Bool?;
}

struct NestedOptionalStruct {
    nested: OptionalComposite?;
}

contract NestedOptionalStructTest {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{ nested: null };
    }
}