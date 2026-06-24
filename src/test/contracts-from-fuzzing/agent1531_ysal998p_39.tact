struct WrappedBool {
    b: Bool;
}

contract ManyWrappedBool {
    x: WrappedBool;
    y: WrappedBool;

    init() {
        self.x = WrappedBool{b:true};
        self.y = WrappedBool{b:false};
    }
}
