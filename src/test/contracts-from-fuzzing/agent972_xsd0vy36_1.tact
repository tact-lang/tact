struct NestedInner {
    deepValue: Int?;
}

struct NestedOuter {
    inner: NestedInner?;
    label: String;
}

contract TestNestedStructs {
    data: NestedOuter;

    init() {
        self.data = NestedOuter{
            inner: NestedInner{ deepValue: 42 },
            label: "test"
        };
    }
}
