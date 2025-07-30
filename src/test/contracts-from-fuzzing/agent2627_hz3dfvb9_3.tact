struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptTest {
    opt: OptionalFields;
    
    init() {
        self.opt = OptionalFields{
            a: null,
            b: true,
            c: "hello"
        };
    }
}