struct OptWrapper {
    inner: Int?;
}

contract OptionalPersistence {
    field: OptWrapper;
    
    init() {
        self.field = OptWrapper{ inner: null };
    }
    
    receive() {
        let x = self.field.inner;
    }
}