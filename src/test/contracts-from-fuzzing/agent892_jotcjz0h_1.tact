struct NestedInner {
    ni1: Int;
    ni2: Bool;
    ni3: String;
}

struct NestedOuter {
    no1: Int;
    no2: NestedInner;
    no3: Bool;
}

contract TestContract {
    data: NestedOuter;
    init() {
        self.data = NestedOuter{
            no1: 5,
            no2: NestedInner{ ni1: 1, ni2: false, ni3: "hi" },
            no3: true
        };
    }
}