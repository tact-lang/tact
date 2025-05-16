struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract Test {
    data: OptionalFields;
    init() {
        self.data = OptionalFields{
            a:null, b:null, c:null, d:null
        };
    }
}