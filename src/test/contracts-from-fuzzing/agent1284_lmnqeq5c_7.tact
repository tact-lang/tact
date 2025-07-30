struct InnerMost {
    val: Int;
}

struct Middle {
    inner: InnerMost;
}

contract TestContract {
    middle: Middle;

    init() {
        self.middle = Middle{ inner: InnerMost{ val: 99 } };
    }
}