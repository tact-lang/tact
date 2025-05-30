struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract OptStructInContract {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{ x: null, y: null };
    }
}
