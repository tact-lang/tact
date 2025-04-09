struct RecA {
    inner: RecB;
}

struct RecB {
    val: Int;
}

contract RecursiveTheirWay {
    rec: RecA;

    init() {
        self.rec = RecA { inner: RecB{ val: 1 } };
    }
}