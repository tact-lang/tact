struct NestedOptional {
    maybeInner: InnerLayer?;
}

struct InnerLayer {
    flag: Bool;
    text: String;
}

contract TestContract {
    nestedOpt: NestedOptional;
    
    init() {
        self.nestedOpt = NestedOptional{
            maybeInner: InnerLayer{
                flag: false,
                text: "opt test",
            },
        };
    }
}
