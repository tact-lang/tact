struct Optionals1 {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct Optionals2 {
    d: Optionals1?;
    e: Int;
}

contract MultiOptTest {
    data: Optionals2 = Optionals2{ d: null, e: 0 };

    init() {
        self.data = Optionals2{
            d: Optionals1{ a: 1, b: true, c: "s" },
            e: 100
        };
    }
}
