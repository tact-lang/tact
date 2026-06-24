struct InnerOpt {
    v1: Int?;
    v2: Bool?;
}

struct OuterOpt {
    inner: InnerOpt?;
    text: String?;
}

contract OptionalNestedStructs {
    data: OuterOpt;

    init() {
        self.data = OuterOpt{
            inner: null,
            text: "some"
        };
    }
}