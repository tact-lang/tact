struct Sub {
    val: Int = 1;
    flag: Bool = false;
}

contract TestContract {
    optSub: Sub?;

    init() {
        self.optSub = null;
    }
}