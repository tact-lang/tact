struct OptionalStruct {
    x: Int;
}

contract OptFieldContract {
    value: OptionalStruct?;

    init() {
        self.value = null;
    }
}