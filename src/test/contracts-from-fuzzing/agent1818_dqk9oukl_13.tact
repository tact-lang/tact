struct NestedOptional {
    a: NestedInner?;
}

struct NestedInner {
    b: Int?;
    c: Bool;
}

contract NestedOptTest {
    val: NestedOptional;

    init() {
        self.val = NestedOptional{
            a: NestedInner{
                b: null,
                c: true
            }
        };
    }
}
