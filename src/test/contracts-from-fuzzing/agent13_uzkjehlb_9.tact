struct OneField {
    x: Int;
}

struct TwoField {
    y: Int;
    opt: OneField?;
}

contract OptionalNestedStruct {
    data: TwoField;

    init() {
        self.data = TwoField{
            y: 1,
            opt: null,
        };
    }
}