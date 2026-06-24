contract WithOptionalStruct {
    s: OptionalStruct?;
    
    init() {
        self.s = null;
    }
}

struct OptionalStruct {
    a: Int;
}
