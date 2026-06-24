struct Weird {
    a: Int?;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
}

contract WeirdTest {
    w: Weird = Weird{ a: null, b: false, c: null, d: null, e: 0 };

    init() {
        self.w = Weird{ a: 5, b: true, c: 7, d: false, e: 10 };
    }
}
