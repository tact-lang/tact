struct OptionalBuilder {
    b: Builder?;
}

contract TestBuilderOpt {
    val: OptionalBuilder;
    init() {
        self.val = OptionalBuilder { b: null };
    }
}