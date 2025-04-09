struct NestedOptionalStructs {
    inside: InnerOpt?;
}

struct InnerOpt {
    a: Int;
    b: Bool?;
}

contract NestedOptStructTest {
    data: NestedOptionalStructs;

    init() {
        self.data = NestedOptionalStructs{ inside: InnerOpt{ a: 5, b: false } };
    }
}