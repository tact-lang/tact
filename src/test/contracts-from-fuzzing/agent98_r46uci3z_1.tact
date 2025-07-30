struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    ni: NestedInner;
    flag: Bool;
}

contract NestedStructContract {
    ns: NestedOuter;
    
    init() {
        self.ns = NestedOuter{
            ni: NestedInner{
                a: 123,
                b: true,
            },
            flag: false,
        };
    }
}