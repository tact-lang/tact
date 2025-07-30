struct OptionalStruct {
    x: Int; 
    y: Bool;
}

contract OptStructField {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{ x: 13, y: true };
    }
}