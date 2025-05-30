struct OptionalStringAndBool {
    s: String?;
    b: Bool?;
}

contract OptionStringBool {
    f: OptionalStringAndBool;

    init() {
        self.f = OptionalStringAndBool{s:null,b:null};
    }
}