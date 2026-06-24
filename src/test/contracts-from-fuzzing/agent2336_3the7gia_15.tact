struct Middle {
    val1: Int;
    val2: Int?;
    val3: String;
}

contract Test {
    mainVal: Middle;

    init() {
        self.mainVal = Middle{ val1: 99, val2: null, val3: "yo" };
    }
}