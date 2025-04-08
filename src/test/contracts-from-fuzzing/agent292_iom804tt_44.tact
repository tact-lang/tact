struct WrappedString {
    val: String;
}

contract DifferentStringWrappers {
    s1: WrappedString;
    s2: WrappedString;

    init() {
        self.s1 = WrappedString{ val:"abc" };
        self.s2 = WrappedString{ val:"def" };
    }
}