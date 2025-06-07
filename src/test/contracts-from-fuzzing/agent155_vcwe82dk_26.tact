struct InnerOptional {
    x: Int = 5;
    y: Bool = true;
}

contract TestContract {
    optInner: InnerOptional? = null;

    init() {
        self.optInner = null;
    }
}