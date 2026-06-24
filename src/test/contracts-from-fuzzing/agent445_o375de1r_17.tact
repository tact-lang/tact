// Mix of optional and non-optional nested fields
struct InnerOpt {
    a: Int?;
    b: String;
}

struct Container {
    x: Int;
    y: InnerOpt;
}

contract OptMixed {
    st: Container;

    init() {
        self.st = Container{
            x: 123,
            y: InnerOpt{
                a: null,
                b: "foo"
            }
        };
    }
}
