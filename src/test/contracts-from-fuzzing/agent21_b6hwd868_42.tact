struct SWithString {
    s: String;
}

contract ContractStr {
    f: SWithString;

    init() {
        self.f = SWithString{ s: "hello" };
    }
}