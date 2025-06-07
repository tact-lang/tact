struct P {
    x: Int? = null;
    y: String? = null;
}

contract DefaultOptStructField {
    val: P = P{};

    init() {
        self.val = P{ x: 1, y: "a" };
    }
}