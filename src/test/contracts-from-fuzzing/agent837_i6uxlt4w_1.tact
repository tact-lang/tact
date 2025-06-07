struct InnerOpt {
    x: Int?;
}

contract TestNestedOptionalFields {
    nested: InnerOpt;

    init() {
        self.nested = InnerOpt{ x: null };
    }
    
    receive() {
        let _ = self.nested.x;
    }
}