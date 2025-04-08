struct SInner {
    x: Int;
    y: Bool;
}

struct SOuter {
    alpha: Int;
    beta: SInner?;
    gamma: Bool;
}

contract OptionalStructField {
    data: SOuter;

    init() {
        self.data = SOuter{
            alpha: 10,
            beta: null,
            gamma: true
        };
    }
}