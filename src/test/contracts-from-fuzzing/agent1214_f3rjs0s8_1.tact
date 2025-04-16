struct DeepOne { nested: Int; }

contract SingleField {
    field: DeepOne; 
    init() {
        self.field = DeepOne{ nested: 123 };
    }
}