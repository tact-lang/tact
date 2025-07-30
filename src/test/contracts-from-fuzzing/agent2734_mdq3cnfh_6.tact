struct First {
    x: Int;
    y: Bool;
}

struct Second {
    payload: Cell;
    str: String;
}

contract ManyStructs {
    a: First;
    b: Second;

    init() {
        self.a = First{ x: 1, y: false };
        self.b = Second{ payload: emptyCell(), str: "text" };
    }
}