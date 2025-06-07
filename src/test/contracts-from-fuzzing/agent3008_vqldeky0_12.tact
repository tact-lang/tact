struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    one: NestedOptionals;
    two: NestedOptionals;
}

contract OptNested {
    data: Container;

    init() {
        self.data = Container{
            one: NestedOptionals{
                a: null,
                b: null,
                c: null,
            },
            two: NestedOptionals{
                a: 123,
                b: true,
                c: "abc",
            },
        };
    }
}