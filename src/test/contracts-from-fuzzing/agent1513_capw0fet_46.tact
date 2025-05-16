struct IntBoolStr {
    i: Int;
    b: Bool;
    s: String;
}

contract IBSOrder {
    x: IntBoolStr;

    init() {
        self.x = IntBoolStr{ i: 5, b: true, s: "wow" };
    }
}