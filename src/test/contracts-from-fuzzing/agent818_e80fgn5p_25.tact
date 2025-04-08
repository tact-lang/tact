struct SInner {
    val: Int;
    txt: String?;
}

contract SOptTop {
    s: SInner?;

    init() {
        self.s = null;
    }
}