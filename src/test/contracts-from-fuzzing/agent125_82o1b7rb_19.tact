struct OptionalStrings {
    a: String?;
    b: String?;
    c: String?;
    d: String?;
    e: String?;
}

contract TestContract {
    storage: OptionalStrings;
    init() {
        self.storage = OptionalStrings{
            a:null, b:null, c:null, d:null, e:null
        };
    }
}