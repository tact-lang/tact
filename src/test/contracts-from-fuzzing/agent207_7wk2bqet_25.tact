struct NestedOptionalTest {
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    nested: InnerStruct?;
}

struct InnerStruct {
    s: String;
    c: Cell?;
}

contract Test23 {
    f: NestedOptionalTest;
    init() {
        self.f = NestedOptionalTest{
            o1: null,
            o2: null,
            o3: null,
            nested: InnerStruct{
                s: "str",
                c: emptyCell()
            }
        };
    }
}