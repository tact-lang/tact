struct OptionalStruct {
    x: Int;
    y: Bool;
}

contract OptionalStructField {
    opt: OptionalStruct?;
    init() {
        self.opt = OptionalStruct{ x: 12, y: true };
    }
}