// deeply nested optionals + serialization + defaults
struct Bottom {
    x: Int as uint8 = 7;
    y: Bool?;
}

struct Mid {
    inner: Bottom?;
    z: Int as int64 = 42;
}

struct Top {
    mid: Mid?;
    s: String = "hi";
}

contract TestContract {
    val: Top?;
    init() {
        self.val = null;
    }
}
