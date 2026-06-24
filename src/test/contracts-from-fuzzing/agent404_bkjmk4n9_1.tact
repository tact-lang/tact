struct NestedField {
    a: Int;
    b: Bool;
}

contract TestContract {
    data: NestedField;
    
    init() {
        self.data = NestedField{a: 1, b: true};
    }
}