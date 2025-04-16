struct AllOptional {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Slice?;
}

contract OptionalFields {
    data: AllOptional;
    init() {
        self.data = AllOptional{ a:null, b:null, c:null, d:null };
    }
}
