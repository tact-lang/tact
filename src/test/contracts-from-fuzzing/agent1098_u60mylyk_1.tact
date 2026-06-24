struct NestedInner {
    flag: Bool;
    counter: Int?;
}

struct NestedOuter {
    data: NestedInner;
    text: String;
}

contract TestContract {
    nested: NestedOuter;
    flag2: Bool;

    init() {
        self.nested = NestedOuter{
            data: NestedInner{
                flag: false,
                counter: null
            },
            text: "test"
        };
        self.flag2 = true;
    }
}
