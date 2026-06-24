struct NestedOpt {
    innerOpt: Int?;
    flag: Bool;
}

struct OuterOpt {
    nestedOpt: NestedOpt?;
    text: String;
}

contract NestedOptionals {
    storage: OuterOpt;

    init() {
        self.storage = OuterOpt{
            nestedOpt: null,
            text: "example"
        };
    }
}