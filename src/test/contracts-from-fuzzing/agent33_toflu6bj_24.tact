struct Mixed {
    a: Int as int7;
    b: Bool?;
    c: Int as uint13;
    d: Bool?;
    e: Int as int22;
}

contract TestContract {
    data: Mixed;

    init() {
        self.data = Mixed{ a: -5, b: null, c: 12, d: null, e: -33 };
    }
}