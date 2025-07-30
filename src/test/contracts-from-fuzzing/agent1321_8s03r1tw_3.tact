struct Inner {
    q: Int;
}

struct Outer {
    p: Inner?;
}

contract DeepOpt {
    val: Outer;
    init() {
        self.val = Outer{ p: null };
    }
}