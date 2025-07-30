struct OptionalFields {
    id: Int?;
    name: String?;
    active: Bool?;
}

contract OptTest {
    data: OptionalFields;
    
    init() {
        self.data = OptionalFields{
            id: null,
            name: null,
            active: true
        };
    }
}