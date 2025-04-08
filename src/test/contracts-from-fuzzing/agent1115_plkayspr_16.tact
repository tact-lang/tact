struct NestedOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Container {
    nested: NestedOptionals?;
}

contract OptionalsLayer {
    data: Container;

    init() {
        self.data = Container {
            nested: NestedOptionals {
                a: null,
                b: true,
                c: "text"
            }
        };
    }
}
