struct WrapBool {
    b: Bool;
}

contract WrapBoolStore {
    data: WrapBool;
    init() {
        self.data = WrapBool{ b: true };
    }
}