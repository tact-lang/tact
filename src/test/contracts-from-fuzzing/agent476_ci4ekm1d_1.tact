struct Nested {
    inner: Int;
}

contract DeepOptionalNested {
    nestedField: Nested?;

    init() {
        self.nestedField = null;
    }
    
    receive() {
        if (self.nestedField != null) {
            let _ = self.nestedField!!;
        }
    }
}