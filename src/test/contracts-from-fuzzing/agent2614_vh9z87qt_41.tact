struct OptionalSliceDefault {
    s: Slice?;
}

contract OptionalSliceDefaultTest {
    data: OptionalSliceDefault;

    init() {
        self.data = OptionalSliceDefault{
            s: null
        };
    }
}