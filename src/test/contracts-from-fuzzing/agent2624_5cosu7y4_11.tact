struct NestedOptionalInner {
    flag: Bool?;
    note: String;
}

struct OuterOptionalContainer {
    inner: NestedOptionalInner?;
    number: Int;
}

contract NestedOptionalStructField {
    state: OuterOptionalContainer;

    init() {
        self.state = OuterOptionalContainer{
            inner: NestedOptionalInner{
                flag: null,
                note: "test"
            },
            number: 99
        };
    }
}
