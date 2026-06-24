struct IntAndOption {
    req: Int;
    opt: String?;
}

contract TestRequiredOptional {
    val: IntAndOption;
    init() {
        self.val = IntAndOption{ req: 7, opt: null };
    }
}