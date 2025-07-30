struct OptionalStruct {
    x: Int;
    y: Bool;
}

contract OptionalStructField {
    optField: OptionalStruct?;
    
    init() {
        self.optField = null;
    }
    
    receive() {
        self.optField = OptionalStruct{x: 42, y: true};
    }
}