struct OptionalBool {
    val: Bool?;
}

contract OptBoolContract {
    data: OptionalBool;
    init() {
        self.data = OptionalBool { val: null };
    }
}