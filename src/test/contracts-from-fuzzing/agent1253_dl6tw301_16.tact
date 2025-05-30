struct InnerMost { q: Int }

struct Inner {
    p: InnerMost?;
}

struct Outer {
    x: Inner;
}

contract OptDeep {
    val: Outer;

    init() {
        self.val = Outer{
            x: Inner{
                p: null
            }
        };
    }

    receive() {}
}