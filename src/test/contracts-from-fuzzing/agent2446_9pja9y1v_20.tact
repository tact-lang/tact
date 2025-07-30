struct EmptyStrings {
    s1: String = "";
    s2: String = "";
}

contract EmptyStringContract {
    val: EmptyStrings;

    init() {
        self.val = EmptyStrings{};
    }
}