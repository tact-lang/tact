struct DeepOptional {
    deepField: Int?;
}

contract DeepOptionalTest {
    field: DeepOptional;
    
    init() {
        self.field = DeepOptional{ deepField: null };
    }
}