struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Outer {
    inner: NestedOptional?;
}

contract NestedOptTest {
    state: Outer;

    init() {
        self.state = Outer{ inner: null };
    }
}