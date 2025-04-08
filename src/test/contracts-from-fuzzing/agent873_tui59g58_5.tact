struct OptionalNested {
    data: Int?;
    inner: InnerOpt?;
}

struct InnerOpt {
    message: String?;
}

contract OptionalInOptional {
    field: OptionalNested;
    
    init() {
        self.field = OptionalNested{
            data: null,
            inner: null
        };
    }
}