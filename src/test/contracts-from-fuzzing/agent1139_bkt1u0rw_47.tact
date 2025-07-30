struct HasDefaults {
    a: Int = 1;
    b: Int? = null;
    c: Bool? = null;
}

contract NestedDefaultsOptionals {
    inner: HasDefaults?;
    
    init() {
        self.inner = null;
    }
}