struct NestedOptional {
    x: Int?;
    y: String?;
}

struct Container {
    nested: NestedOptional?;
}

contract NestedOptTest {
    c: Container;

    init() {
        self.c = Container{
            nested: NestedOptional{
                x: null,
                y: null
            }
        };
    }
}