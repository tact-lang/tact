struct OptionalSliceString {
    data: Slice?;
    text: String?;
}

contract OSSContract {
    field: OptionalSliceString;
    init() {
        self.field = OptionalSliceString{
            data: null,
            text: null
        };
    }
}