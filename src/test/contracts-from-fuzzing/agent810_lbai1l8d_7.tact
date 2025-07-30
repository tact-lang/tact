struct Inner { x: Int; y: Int; }

contract OptionalStructState {
    s: Inner?;
    init() {
        self.s = null;
    }
}
