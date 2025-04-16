struct OptionalSliceBuilder {
    s: Slice?;
    b: Builder?;
}

contract OptionalSBTest {
    data: OptionalSliceBuilder;

    init() {
        self.data = OptionalSliceBuilder{
            s: null,
            b: null,
        };
    }
}