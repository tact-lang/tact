struct InnerData {
    x: Int;
    y: Bool;
}

contract ManyInnerInits {
    a: InnerData;
    b: InnerData;

    init() {
        self.a = InnerData{ x: 1, y: true };
        self.b = InnerData{ x: 2, y: false };
    }
}