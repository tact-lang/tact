struct NestedOptionals {
    o1: Int?;
    o2: Bool?;
    o3: String?;
    nested: InnerOptional?;
}

struct InnerOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalNestContract {
    data: NestedOptionals;

    init() {
        self.data = NestedOptionals{
            o1: null,
            o2: null,
            o3: null,
            nested: null,
        };
    }
}