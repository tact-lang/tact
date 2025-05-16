struct InnerOpt {
    val: Int?;
}

struct OuterOpt {
    nested: InnerOpt?;
}

contract OptionalNestedStructOpt {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            nested: null
        };
    }
}