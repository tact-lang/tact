struct NestedInner {
    flag: Bool;
    description: String;
}

struct NestedOuter {
    num: Int;
    maybeInner: NestedInner?;
}

contract DeepNestedOptionals {
    data: NestedOuter;
    
    init() {
        self.data = NestedOuter{
            num: 42,
            maybeInner: null,
        };
    }
}