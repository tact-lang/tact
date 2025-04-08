struct OptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
}

contract ManyOptionalStrings {
    data: OptionalStrings?;
    
    init() {
        self.data = null;
    }
}