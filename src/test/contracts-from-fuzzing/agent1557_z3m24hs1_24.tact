struct WeirdOrder {
    x: Int;
    y: StrangeSide;
}

struct StrangeSide {
    v: Int;
    txt: String;
}

contract SiblingOrder {
    data: WeirdOrder;

    init() {
        self.data = WeirdOrder{ x: 5, y: StrangeSide{ v: 7, txt: "yo" } };
    }
}