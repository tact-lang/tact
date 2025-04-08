struct Inner1 {
    x1: Int;
}

struct Inner2 {
    y1: Int;
}

contract OptionalInContract {
    inner1: Inner1?;
    inner2: Inner2;

    init() {
        self.inner1 = null;
        self.inner2 = Inner2{y1:7};
    }
}
