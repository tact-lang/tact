struct MiddleOpt {
    x: Int?;
}
struct OuterOptCont {
    val: MiddleOpt?;
}

contract BigOptWrap {
    wrapper: OuterOptCont?;

    init() {
        self.wrapper = null;
    }
}