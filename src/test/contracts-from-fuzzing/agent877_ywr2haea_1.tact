struct NestedInner {
    val: Int;
    flag: Bool;
}

struct NestedOuter {
    optInner: NestedInner?; 
    name: String;
}

contract TestContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            optInner: null,
            name: "TestName",
        };
    }
}