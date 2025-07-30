// struct with mix of optional + normal + optional of struct + nested optional int
struct Little {
    x: Int;
    y: Int?;
}

struct Combo {
    a: Int;
    b: Int?;
    c: Bool;
    d: Little?;
}

contract TestCombo {
    payload: Combo;
    init() {
        self.payload = Combo {
            a: 1,
            b: null,
            c: true,
            d: Little{ x: 55, y: null },
        };
    }
}
