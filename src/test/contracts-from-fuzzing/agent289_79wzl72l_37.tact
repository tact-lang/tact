struct IntStrOpt {
    a: Int;
    b: String?;
}

struct OuterOpt {
    x: IntStrOpt?;
}

contract NestedOptionalStructField {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            x: null
        };
    }
}