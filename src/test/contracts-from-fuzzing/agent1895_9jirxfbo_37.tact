struct OptionalBool {
    b: Bool?;
}

contract OptBoolStruct {
    val: OptionalBool;
    init() {
        self.val = OptionalBool{ b: false };
    }
}