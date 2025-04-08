struct ManyStrings {
    a: String;
    b: String?;
    c: String;
    d: String?;
}
contract ManyStringsContract {
    storage: ManyStrings;
    init() {
        self.storage = ManyStrings{
            a:"alpha",
            b:null,
            c:"gamma",
            d:null
        };
    }
}