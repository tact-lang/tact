// Test contract with a struct with many string optionals
struct StringsOpt {
    s1: String?;
    s2: String?;
    s3: String?;
    s4: String?;
}

contract OptStrContract {
    s: StringsOpt;

    init() {
        self.s = StringsOpt{
            s1:null,
            s2:"hello",
            s3:null,
            s4:"world"
        };
    }
}