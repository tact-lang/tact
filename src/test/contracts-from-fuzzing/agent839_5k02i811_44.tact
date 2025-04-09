struct Wrapper {
    payload: Int;
}

contract OptWrap {
    item: Wrapper?;
    init() {
        self.item = null;
    }
}