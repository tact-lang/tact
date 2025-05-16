struct ManyOptionalStrings {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
    s5: String?;
    s6: String?;
}

contract OptStringsContract {
    state: ManyOptionalStrings;
    
    init() {
        self.state = ManyOptionalStrings{
            s1: null,
            s2: "hello",
            s3: "",
            s4: null,
            s5: "world",
            s6: null
        };
    }
}