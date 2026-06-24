struct Nested {
    n1: Int;
    n2: Int?;
}

contract TestContract {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Int?;
    val5: Bool?;
    val6: String?;
    val7: Nested;
    val8: Nested?;

    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "hi";
        self.val4 = null;
        self.val5 = null;
        self.val6 = null;
        self.val7 = Nested{n1: 7, n2: null};
        self.val8 = null;
    }
}