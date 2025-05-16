struct NestedOptional {
    innerValue: Int?; 
}

struct WrapNested {
    nested: NestedOptional?; 
}

contract TestContract {
    field: WrapNested;

    init() {
        self.field = WrapNested{
            nested: null
        };
    }
}
