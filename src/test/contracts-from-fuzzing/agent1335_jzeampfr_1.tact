struct NestedOptional {
    inner: Int?;
}

contract TestContract {
    nested: NestedOptional;
    
    init() {
        self.nested = NestedOptional{ inner: null };
    }
}
