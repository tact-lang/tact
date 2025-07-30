struct OptHolder {
    text: String?;
    number: Int?;
    flag: Bool?;
}

contract OptionalFieldsContract {
    opts: OptHolder;

    init() {
        self.opts = OptHolder{ text: null, number: null, flag: null };
    }
}