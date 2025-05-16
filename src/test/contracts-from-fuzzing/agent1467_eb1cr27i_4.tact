struct OptionalNested {
    innerValue: Int?;
}

contract OptionalExample {
    value: OptionalNested;
    
    init() {
        self.value = OptionalNested{
            innerValue: null
        };
    }
}