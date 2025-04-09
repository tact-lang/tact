struct NestedInner {
    flag: Bool;
    number: Int;
}

struct NestedOuter {
    ref: NestedInner;
    description: String;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            ref: NestedInner{flag: true, number: 42},
            description: "Hello"
        };
    }
}