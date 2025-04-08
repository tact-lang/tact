// Optional inner struct with optional fields
struct InnerWithOpts {
    a: Int?;
    b: Bool?;
}

contract OptionalInnerStruct {
    data: InnerWithOpts?;

    init() {
        self.data = null;
    }
}
