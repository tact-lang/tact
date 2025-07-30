struct Inner {
    val: Int;
}

struct Middle {
    innerOpt: Inner?;
}

contract TestContract {
    middleOpt: Middle?;

    init() {
        self.middleOpt = Middle{ innerOpt: Inner{ val: 42 } };
    }
}