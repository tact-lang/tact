struct OptionalStructField {
    inner: Int?;
}

struct ContainerOptionalStructField {
    maybeInner: OptionalStructField?;
}

contract OptionalStructFieldContract {
    data: ContainerOptionalStructField;

    init() {
        self.data = ContainerOptionalStructField{
            maybeInner: null
        };
    }
}
