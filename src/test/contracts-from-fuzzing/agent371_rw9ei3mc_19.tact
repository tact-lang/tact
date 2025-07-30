struct OptStr {
    x: String?;
}

contract InitDefaultOpt {
    val: OptStr;

    init() {
        self.val = OptStr{x: null};
    }
}