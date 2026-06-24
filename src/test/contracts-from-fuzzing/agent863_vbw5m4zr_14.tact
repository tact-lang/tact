struct Mix1 {
    a: Int;
    b: Bool;
}

struct Mix2 {
    x: String;
    y: Bool?;
}

contract Combo {
    one: Mix1;
    two: Mix2;

    init() {
        self.one = Mix1{ a: 10, b: false };
        self.two = Mix2{ x: "x", y: null };
    }
}