struct Inner {
    innerVal: Int;
}

contract Test29 {
    a: Inner?;
    init() {
        self.a = null;
    }
}