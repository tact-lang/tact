struct OptionalBuilder {
    b: Builder?;
}

contract OptionalBuilderContract {
    ob: OptionalBuilder;

    init() {
        self.ob = OptionalBuilder{b: null};
    }
}