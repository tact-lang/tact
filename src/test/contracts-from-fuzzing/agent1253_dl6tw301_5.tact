struct Inner {
    val: Int?; 
}

contract NestedOptionalField {
    nested: Inner;
    
    init() {
        self.nested = Inner{ val: null };
    }
    
    receive() {}
}