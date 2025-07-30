struct Sub {
    val1: Int;
    val2: Int;
    val3: Int;
    val4: Bool;
    val5: String;
}

contract Test {
    s: Sub;

    init() {
        self.s = Sub{
            val1: 1,
            val2: 2,
            val3: 3,
            val4: false,
            val5: "Hello",
        };
    }
}
