struct InnerBool {
    b: Bool;
}

struct Outer {
    x: Int;
    nested: InnerBool;
}

contract BoolNestedTest {
    data: Outer;

    init() {
        self.data = Outer{ x:5, nested: InnerBool{ b:true } };
    }
}