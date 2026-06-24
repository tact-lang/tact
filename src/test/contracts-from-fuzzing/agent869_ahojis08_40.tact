struct MultiLevel {
    inner1: Int;
    inner2: Bool;
    optionalStr: String?;
}

contract Mixed {
    val1: Int;
    val2: MultiLevel;
    val3: MultiLevel?;

    init() {
        self.val1 = 5;
        self.val2 = MultiLevel{ inner1: 1, inner2: false, optionalStr: null };
        self.val3 = null;
    }
}