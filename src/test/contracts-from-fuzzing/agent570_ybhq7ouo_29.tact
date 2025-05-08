message(1234) OptionMsg {
    data: Int?;
    label: String;
}

contract OptMessageField {
    val: OptionMsg?;

    init() {
        self.val = null;
    }

    receive() {}
}