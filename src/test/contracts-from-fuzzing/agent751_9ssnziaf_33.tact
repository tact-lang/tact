// deep nested optional contract fields
struct InnerMost {
    v: Int?;
}

struct Mid {
    inner: InnerMost?;
}

struct Outer {
    mid: Mid?;
}

contract DeepOptionals {
    dep: Outer;

    init() {
        self.dep = Outer{ mid: null };
    }
}