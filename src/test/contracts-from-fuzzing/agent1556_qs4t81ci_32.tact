// optional with nested struct with remaining
struct Deep {
    val: Int = 55;
    tail: Slice as remaining;
}

struct Wrap {
    inner: Deep?;
}

contract TestContract {
    s: Wrap;

    init() {
        self.s = Wrap{inner: Deep{val:42, tail:emptyCell().asSlice()}};
    }

    receive() {
        let _ = self.s.inner;
    }
}