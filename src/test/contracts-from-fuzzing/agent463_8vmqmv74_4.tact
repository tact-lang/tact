struct Inside {
    big: Int;
    flag: Bool;
}

contract TestContract {
    optNested: Inside?;

    init() {
        self.optNested = null;
    }
}