struct NestedOptionalInner {
    flag: Bool;
    data: String?;
}

struct NestedOptionalOuter {
    x: Int;
    y: NestedOptionalInner?;
}

contract OptionalNestDemo {
    myfield: NestedOptionalOuter;

    init() {
        self.myfield = NestedOptionalOuter{
            x: 7,
            y: NestedOptionalInner{
                flag: true,
                data: "nested",
            },
        };
    }
}