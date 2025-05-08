struct NestedS1 {
    a: Int;
    b: Bool;
}

contract Test {
    data: NestedS1;
    
    init() {
        self.data = NestedS1 { a: 5, b: true };
    }
}
