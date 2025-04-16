struct InnerOpt {
    x: Int?;
}

struct OuterOpt {
    a: InnerOpt?;
}

contract TestNestedOptionals {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            a: InnerOpt{ x: null }
        };
    }
}