struct Inner {
    x: Int;
    y: Bool?;
}

struct Mid {
    inner: Inner?;
    flag: Bool;
}

contract EdgeCase {
    storage: Mid?;
    init() {
        self.storage = null;
    }
}