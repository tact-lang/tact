// Optional struct that contains an optional primitive
struct InnerOpt {
    val: Int?;
}

contract OptionalStructWithOptionalField {
    data: InnerOpt?;

    init() {
        self.data = null;
    }
}