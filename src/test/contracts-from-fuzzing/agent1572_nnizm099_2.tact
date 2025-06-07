struct TwoLevelInner {
    x: Int;
    y: Bool?;
}

struct NestedContainer {
    innerField: TwoLevelInner;
    optionalInner: TwoLevelInner?;
    text: String;
}

contract NestedContract {
    nested: NestedContainer = NestedContainer{
        innerField: TwoLevelInner{x: 5, y: true},
        optionalInner: null,
        text: "ok"
    };

    init() {
        self.nested = NestedContainer{
            innerField: TwoLevelInner{x: 42, y: false},
            optionalInner: TwoLevelInner{x: 6, y: null},
            text: "done"
        };
    }
}