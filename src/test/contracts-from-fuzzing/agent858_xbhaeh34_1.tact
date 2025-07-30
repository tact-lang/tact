struct Nested {
    inner1: Int;
    inner2: Bool?;
}

contract Test {
    val1: Int = 1;
    val2: Bool = false;
    val3: String = "abc";
    val4: Address;
    nest: Nested;

    init() {
        self.val4 = myAddress();
        self.nest = Nested{ inner1: 5, inner2: true };
    }
}