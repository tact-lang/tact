struct OptionalStruct {
    x: Int;
    y: String?;
}

contract OptionalFieldContract {
    s: OptionalStruct?;

    init() {
        self.s = OptionalStruct{
            x: 1,
            y: null
        };
    }
}