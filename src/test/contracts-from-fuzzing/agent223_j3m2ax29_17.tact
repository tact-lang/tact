struct OptionalBool {
    flag: Bool?;
}

contract TopOptionalBool {
    val: OptionalBool;

    init() {
        self.val = OptionalBool{flag: null};
    }
}