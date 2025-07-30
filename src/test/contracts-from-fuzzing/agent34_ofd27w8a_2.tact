struct NestedInner {
    flag: Bool;
    note: String;
}

struct NestedOuter {
    number: Int;
    maybe: NestedInner?;
}

contract NestedStructContract {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            number: 7,
            maybe: NestedInner{
                flag: true,
                note: "test"
            }
        };
    }
}