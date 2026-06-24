struct OneField {
    a: Int;
}

struct TwoFields {
    first: OneField;
    second: Int;
}

struct ThreeFields {
    one: TwoFields;
    two: OneField;
}

contract NestedChain {
    data: ThreeFields;
    init() {
        self.data = ThreeFields{
            one: TwoFields{
                first: OneField{a: 1},
                second: 2,
            },
            two: OneField{a:3},
        };
    }
}