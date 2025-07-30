struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract NestedOptionalDemo {
    field: OuterOpt;

    init() {
        self.field = OuterOpt{
            nested: InnerOpt{ val: 123 }
        };
    }
}