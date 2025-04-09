struct NestedOptional {
    s: String?;
    b: Bool?;
    n: Int?;
}

contract NestedOptTest {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            s: null,
            b: null,
            n: null,
        };
    }
}