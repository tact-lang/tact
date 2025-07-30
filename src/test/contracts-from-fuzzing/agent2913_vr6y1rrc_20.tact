struct AlmostEmpty {
    f: Int;
}

contract AlmostNothing {
    field: AlmostEmpty;
    
    init() {
        self.field = AlmostEmpty{ f: 42 };
    }
}