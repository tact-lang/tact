struct OptionalStrBool {
    s: String?;
    b: Bool?;
}

contract OptStrBool {
    data: OptionalStrBool;

    init() {
        self.data = OptionalStrBool{
            s:null,
            b:null
        };
    }
}