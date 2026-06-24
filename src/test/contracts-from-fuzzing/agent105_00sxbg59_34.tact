struct HasBool {
    b: Bool;
}

contract OptionalOfStruct {
    val: HasBool?;

    init() {
        self.val = null;
    }
}