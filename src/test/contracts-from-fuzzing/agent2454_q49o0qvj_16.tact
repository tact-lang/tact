struct OptionalString {
    name: String?;
}

contract OptStringTest {
    data: OptionalString;
    
    init() {
        self.data = OptionalString{
            name: null
        };
    }
}