struct InnerFields {
    a: Int;
    b: Int;
}

struct OuterFields {
    one: Int;
    inr: InnerFields;
    two: Int;
}

contract StructInBetween {
    state: OuterFields;

    init() {
        self.state = OuterFields{ one: 1, inr: InnerFields{ a: 10, b: 20 }, two: 2 };
    }
}
