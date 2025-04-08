struct OptionField {
    s: InnerOption?;
}

struct InnerOption {
    x: Int = 42;
    y: Bool = false;
}

contract Test {
    data: OptionField;

    init() {
        self.data = OptionField{
            s: null,
        };
    }
}