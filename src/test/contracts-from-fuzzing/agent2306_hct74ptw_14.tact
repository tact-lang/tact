struct IntStruct {
    a: Int;
    b: Int;
}

contract OptionalOuter {
    field: IntStruct?;
    
    init() {
        self.field = null;
    }
}
