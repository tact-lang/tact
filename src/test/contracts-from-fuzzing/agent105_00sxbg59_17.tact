struct FlagWrap {
    flag: Bool;
}

contract OptionalStructDefault {
    val: FlagWrap?;

    init() {
        self.val = null;
    }
}