struct Leaf {
    z: String?;
}

struct Mid {
    inner: Leaf?;
}

contract TopLevelOpt {
    val: Mid?;

    init() {
        self.val = null;
    }
}
