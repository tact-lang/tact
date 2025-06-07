struct Deep {
    inner1: Bool;
    inner2: Int?;
    inner3: String;
    inner4: Int;
}

contract MultiLayer {
    val1: Int;
    val2: Deep;

    init() {
        self.val1 = 5;
        self.val2 = Deep{
            inner1: true,
            inner2: null,
            inner3: "data",
            inner4: 42
        };
    }
}