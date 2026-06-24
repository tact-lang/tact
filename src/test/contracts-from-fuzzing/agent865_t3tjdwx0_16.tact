// Optional containing nested struct with optionals
struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract OptNestedStructField {
    payload: InnerOpt?;

    init() {
        self.payload = InnerOpt{
            x: 42,
            y: null,
        };
    }
}
