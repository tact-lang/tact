struct DeeplyNestedOptional {
    first: Int;
    optnested: NestedOptional?;
}

struct NestedOptional {
    s: String?;
    b: Bool?;
    n: Int?;
}

contract DeepOptTest {
    val: DeeplyNestedOptional;

    init() {
        self.val = DeeplyNestedOptional{
            first: 123,
            optnested: null,
        };
    }
}