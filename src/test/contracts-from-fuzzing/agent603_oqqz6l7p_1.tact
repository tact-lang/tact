struct SimpleNested {
    value: Int;
}

contract TestContract {
    nested: SimpleNested;
    
    init() {
        self.nested = SimpleNested{ value: 42 };
    }
}