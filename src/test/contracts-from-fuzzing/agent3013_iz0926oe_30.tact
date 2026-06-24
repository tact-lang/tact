struct Mid {
    s: String?;
}

struct Out {
    mid: Mid?;
}

contract WrappedNull {
    val: Out;

    init() {
        self.val = Out{mid: null};
    }
}
