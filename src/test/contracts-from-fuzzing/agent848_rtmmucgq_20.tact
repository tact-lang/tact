struct OptionalString {
    s: String?;
}

contract OptionalStringStructField {
    data: OptionalString;

    init() {
        self.data = OptionalString{
            s: "hi"
        };
    }
}