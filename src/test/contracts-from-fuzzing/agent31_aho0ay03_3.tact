struct OptionalStruct {
    x: Int?;
    y: Int?;
    z: Int?;
}

contract TestContract {
    optVal: OptionalStruct?;

    init() {
        self.optVal = null;
    }
}
