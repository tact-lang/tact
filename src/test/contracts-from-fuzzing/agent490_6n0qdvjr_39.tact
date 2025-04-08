struct WrapBool {
    b: Bool;
}

contract BoolField {
    x: WrapBool;
    init() {
        self.x = WrapBool{ b:true };
    }
}