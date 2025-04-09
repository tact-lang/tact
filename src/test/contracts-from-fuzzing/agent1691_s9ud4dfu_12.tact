struct Outer {
    mid: Middle;
}

struct Middle {
    inner: Inner;
}

struct Inner {
    x: Int;
}

contract TripleNested {
    val: Outer;

    init() {
        self.val = Outer{
            mid: Middle{
                inner: Inner{
                    x: 5
                }
            }
        };
    }
}