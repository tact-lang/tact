struct OptionalStruct {
    x: Int;
    y: String;
}

contract WithOptionalField {
    optVal: OptionalStruct?;
    
    init() {
        self.optVal = null;
    }
}