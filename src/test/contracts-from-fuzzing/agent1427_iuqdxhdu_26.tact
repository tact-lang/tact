struct JustOptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
}

contract NullOptStructTest {
    data: JustOptionalFields;
    init() {
        self.data = JustOptionalFields{
            a:null, b:null, c:null, d:null
        };
    }
}