struct Holder {
    inner: Int;
}

contract OptionalHolder {
    opt: Holder?;

    init() {
        self.opt = null;
    }
}
