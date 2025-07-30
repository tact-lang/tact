struct NestedOptInner {
    flag: Bool?;
}

struct NestedOptOuter {
    payload: NestedOptInner?;
}

contract OptionalInOptionalStruct {
    data: NestedOptOuter;

    init() {
        self.data = NestedOptOuter{payload: null};
    }
}