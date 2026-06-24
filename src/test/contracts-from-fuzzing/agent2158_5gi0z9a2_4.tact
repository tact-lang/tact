struct OptionalFields {
    val: Int?;
    flag: Bool?;
}

contract OptionalFieldsTest {
    data: OptionalFields;
    
    init() {
        self.data = OptionalFields{ val: null, flag: true };
    }
}