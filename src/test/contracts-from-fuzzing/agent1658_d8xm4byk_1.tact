struct DeeplyNested {
    subfield: NestedOptionalFields;
}

struct NestedOptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract StorageTest {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            subfield: NestedOptionalFields{
                a: null,
                b: false,
                c: null,
                d: "hi"
            }
        };
    }
}
