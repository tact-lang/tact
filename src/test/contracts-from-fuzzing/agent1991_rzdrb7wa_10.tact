struct DeepOptionalNested {
    one: Int?;
    two: Bool?;
    three: String?;
}

struct OuterOptional {
    inner: DeepOptionalNested?;
}

contract OptionalNestContract {
    data: OuterOptional;

    init() {
        self.data = OuterOptional{ inner: null };
    }
}