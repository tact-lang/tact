struct Inner {
    val: Int;
}

struct Mid {
    inner: Inner?;
}

struct Outer {
    mid: Mid?;
}

contract DeepOptional {
    s: Outer;

    init() {
        self.s = Outer{ mid: null };
    }
}