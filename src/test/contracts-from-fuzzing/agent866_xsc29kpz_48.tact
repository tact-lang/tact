struct WrappedBool {
    b: Bool;
}

contract WrappedBoolContract {
    val: WrappedBool;
    init() {
        self.val = WrappedBool{ b:true };
    }
}