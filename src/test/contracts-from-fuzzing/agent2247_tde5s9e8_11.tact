struct ManyNestedOptionals {
    a: Int?;
    b: Bool?;
    c: Nested1?;
    d: Nested2?;
}

struct Nested1 {
    x: String?;
    y: Cell?;
}

struct Nested2 {
    p: Slice?;
    q: Builder?;
}

contract NestOptTest {
    f: ManyNestedOptionals;

    init() {
        self.f = ManyNestedOptionals{
            a: 1,
            b: false,
            c: Nested1{
                x: "hi",
                y: emptyCell()
            },
            d: null
        };
    }
}
