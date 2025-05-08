struct OptionalStruct {
    inner: Int;
    optInner: Int?;
}

contract OptionalOfStruct {
    data: OptionalStruct?;

    init() {
        self.data = OptionalStruct{inner: 1, optInner: null};
    }
}