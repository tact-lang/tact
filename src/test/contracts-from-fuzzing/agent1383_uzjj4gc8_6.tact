struct OneField {
    x: Int;
}

struct Wrapper {
    nested: OneField;
}

contract SingleNested {
    w: Wrapper;

    init() {
        self.w = Wrapper{
            nested: OneField{
                x: 42
            }
        };
    }
}