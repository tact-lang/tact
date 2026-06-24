struct Inner {
    flag: Bool;
}

struct Middle {
    innerOpt: Inner?;
}

struct Outer {
    middleOpt: Middle?;
}

contract TestContract {
    data: Outer? = null;

    init() {
        self.data = Outer{ middleOpt: Middle{ innerOpt: Inner{ flag: true } } };
    }
    receive() {}
}
