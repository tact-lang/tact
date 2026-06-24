struct HasString {
    s: String;
    sOpt: String?;
    b: Bool;
}

contract MixedOptionalString {
    data: HasString;

    init() {
        self.data = HasString{
            s: "abc",
            sOpt: null,
            b: true
        };
    }
}
