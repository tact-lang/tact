// test contract storage with optional nested struct chain
struct Innermost {
    magic: Int?
}

struct Middle {
    inner: Innermost?
}

struct Outer {
    mid: Middle?
}

contract Test {
    val: Outer;

    init() {
        self.val = Outer{ mid: null };
    }
}