struct Inner {
    z: Int;
}

struct Middle {
    inner: Inner;
}

contract TestContract {
    middleOpt: Middle?;

    init() {
        self.middleOpt = Middle{ inner: Inner{ z: 888 } };
    }
}