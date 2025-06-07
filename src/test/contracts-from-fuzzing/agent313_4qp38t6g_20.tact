struct OptionalBoolString {
    b: Bool?;
    s: String?;
}

contract OptionalBoolStringContract {
    val1: Bool?;
    val2: String?;
    val3: OptionalBoolString;

    init() {
        self.val1 = true;
        self.val2 = null;
        self.val3 = OptionalBoolString{b:null, s:"xyz"};
    }
}