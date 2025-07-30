struct InnerOptional {
    a: Int?;
}

struct NestedOptional {
    b: InnerOptional?;
}

contract NestedOptTest {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{ b: null };
    }
}
