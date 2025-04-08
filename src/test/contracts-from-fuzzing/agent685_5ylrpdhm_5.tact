struct OptionalStruct {
    x: Int?;
    y: Bool?;
}

contract WithOptionals {
    s: OptionalStruct;

    init() {
        self.s = OptionalStruct{ x: null, y: null };
    }
}