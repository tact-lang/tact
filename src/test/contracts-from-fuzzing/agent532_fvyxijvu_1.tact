struct NestedOne {
    a: Int;
    b: Int?;
}

contract TestContract {
    data: NestedOne;
    
    init() {
        self.data = NestedOne{ a: 10, b: null };
    }
}