struct Deepest {
    val: Int;
}

struct Middle {
    inner: Deepest?;
}

struct Upper {
    mid: Middle?;
}

contract Test {
    saved: Upper;

    init() {
        self.saved = Upper{
            mid: null,
        };
    }
}