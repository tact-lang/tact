struct WrappedBool {
    b: Bool;
}

contract WrapOuterBool {
    x: WrappedBool;
    init() {
        self.x = WrappedBool{ b:true };
    }
}