struct SerOpts {
    a: Int as int64;
    b: Int as uint1;
    c: Bool;
}

contract SerOptsTest {
    val: SerOpts;

    init() {
        self.val = SerOpts{a: -5, b: 1, c: false};
    }
}