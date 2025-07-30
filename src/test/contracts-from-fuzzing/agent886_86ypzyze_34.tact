struct DefaultsInner {
    count: Int = 42;
    flag: Bool = true;
    label: String = "hi";
}

contract TestContract {
    optInner: DefaultsInner?;

    init() {
        self.optInner = null;
    }
}