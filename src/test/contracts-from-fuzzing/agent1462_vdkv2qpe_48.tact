struct ImplicitOptionalOnly {
    foo: Int?;
    bar: Bool?;
}

contract ImplicitOptionalOnlyField {
    s: ImplicitOptionalOnly;
    
    init() {
        self.s = ImplicitOptionalOnly{}; 
    }
}