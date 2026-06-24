struct NestedOptional {
    a: Int?;
    b: Bool;
}

struct Container {
    n: NestedOptional?;
    s: String?;
}

contract NestedOptTest {
    val: Container;

    init() {
        self.val = Container{ n: null, s: null };
    }
}
