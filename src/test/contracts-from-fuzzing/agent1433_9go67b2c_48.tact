struct InnerX {
    a: String;
    b: String?;
}

struct MiddleY {
    m: InnerX;
}

contract MixStringPersists {
    data: MiddleY;

    init() {
        self.data = MiddleY{ m: InnerX{ a:"hey", b:null } };
    }
}
