struct HasString {
    s: String;
}

contract ContractWithString {
    f: HasString;

    init() {
        self.f = HasString{s:"test"};
    }
}