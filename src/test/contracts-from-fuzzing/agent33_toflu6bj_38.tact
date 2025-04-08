struct Deepest {
    val: Int;
}

struct Middle {
    deep: Deepest?;
}

struct Top {
    mid: Middle?;
}

contract TestContract {
    val: Top?;

    init() {
        self.val = null;
    }
}