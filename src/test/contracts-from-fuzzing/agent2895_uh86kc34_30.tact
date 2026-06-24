struct OptionalBoolWrapper {
    val: Bool?;
}

contract OptionalBoolInsideStruct {
    wrapper: OptionalBoolWrapper;

    init() {
        self.wrapper = OptionalBoolWrapper{ val: null };
    }
}
