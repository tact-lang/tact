struct Nullables {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Middle {
    nested: Nullables?;
}

contract NullableNest {
    data: Middle;

    init() {
        self.data = Middle{
            nested: null
        };
    }
}
