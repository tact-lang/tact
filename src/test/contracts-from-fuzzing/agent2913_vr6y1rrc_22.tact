struct InnerStrOpt {
    x: String?;
    y: String?;
}

contract OptionalStringFields {
    f: InnerStrOpt;
    
    init() {
        self.f = InnerStrOpt{
            x: null,
            y: "test",
        };
    }
}