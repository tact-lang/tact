// Contract with persistent optional string and nested optional field
struct InnerOpt {
    s: String?;
}

contract OptionalStrings {
    d: InnerOpt?;
    init() {
        self.d = null;
    }
}