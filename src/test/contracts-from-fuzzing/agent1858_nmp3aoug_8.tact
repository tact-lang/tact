struct OptBool {
    b: Bool?;
}

contract OptBoolContract {
    val: OptBool;
    init() {
        self.val = OptBool{ b: null };
    }
}