struct OneDepth {
    val: Int;
}

struct DoubleDepth {
    rec: OneDepth;
    val2: Bool;
}

contract MixDepth {
    data: DoubleDepth;

    init() {
        self.data = DoubleDepth{ rec: OneDepth{ val: 7 }, val2: true };
    }
}