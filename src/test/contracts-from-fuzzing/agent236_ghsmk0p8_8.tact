struct Inner {
    num: Int?;
    text: String?;
}

struct Middle {
    innerOpt: Inner?;
    flag: Bool;
}

contract TestContract {
    optMiddle: Middle?;

    init() {
        self.optMiddle = null;
    }
}