struct NestedInner {
    a: Int;
    b: Bool;
}

struct NestedOuter {
    ni: NestedInner;
    optInt: Int?;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            ni: NestedInner{a: 1, b: true},
            optInt: 5
        };
    }
}