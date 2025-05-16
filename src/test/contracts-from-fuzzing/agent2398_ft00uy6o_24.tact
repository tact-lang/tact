struct OptionalBoolStruct {
    enabled: Bool?;
    active: Bool?;
    ready: Bool?;
}

contract TestContract {
    s: OptionalBoolStruct;

    init() {
        self.s = OptionalBoolStruct{
            enabled: null,
            active: null,
            ready: null
        };
    }
}