struct OneField {
    x: Int;
}

struct Holder {
    nested: OneField;
    optNested: OneField?;
}

contract SingleStructNested {
    h: Holder;
    init() {
        self.h = Holder{
            nested: OneField{x: 42},
            optNested: null
        };
    }
}