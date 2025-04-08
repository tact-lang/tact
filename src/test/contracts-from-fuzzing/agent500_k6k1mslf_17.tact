struct Simple {
    val: Int;
}

contract OptAtTop {
    s: Simple?;

    init() {
        self.s = null;
    }
}