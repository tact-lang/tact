struct InnerOpt {
    x: Int?;
    y: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    msg: String;
}

contract NestedOptionals {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: InnerOpt{
                x: null,
                y: true
            },
            msg: "Nested"
        };
    }
}