struct OptInner {
    num: Int;
    msg: String?;
}

contract OptNested {
    info: OptInner?;

    init() {
        self.info = null;
    }
}