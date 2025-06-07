struct NestedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
}

struct NestedLayer {
    nested: NestedOptionals;
}

contract NestedOptionalLayer {
    data: NestedLayer;

    init() {
        self.data = NestedLayer{ nested: NestedOptionals{ a:null, b:null, c:null } };
    }
}