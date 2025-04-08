struct InnerMost { val: Int; }
struct Middle { inner: InnerMost; }
struct Outer { mid: Middle; }

contract Chain {
    param: Outer;

    init() {
        self.param = Outer { mid: Middle { inner: InnerMost { val: 5 } } };
    }
}