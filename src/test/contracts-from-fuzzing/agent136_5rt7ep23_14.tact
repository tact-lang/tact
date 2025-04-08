struct MultiNestedOptionals {
    a: Int?;
    b: Bool?;
}

struct OuterOptionals {
    x: MultiNestedOptionals?;
    y: MultiNestedOptionals?;
}

contract NestedOptTest {
    top: OuterOptionals;

    init() {
        self.top = OuterOptionals{
            x: MultiNestedOptionals{ a: null, b: true },
            y: null,
        };
    }
}