struct HasBool {
    flag: Bool;
}

contract InitOptional {
    val: HasBool?;

    init() {
        self.val = null;
    }
}