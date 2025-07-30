// Chain of nested optional struct fields (optional wrapper around optional wrapper)

struct InnerMost {
    num: Int;
}

struct Middle {
    inner: InnerMost?;
}

struct Outer {
    mid: Middle?;
}

contract TestContract {
    val: Outer;

    init() {
        self.val = Outer{
            mid: null
        };
    }
}