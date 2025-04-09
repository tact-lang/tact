struct StratA {
    foo: Bool;
}

struct StratB {
    apple: Int?;
    cake: String;
}

contract MultiStructs {
    a: StratA;
    b: StratB;
    init() {
        self.a = StratA{ foo: true };
        self.b = StratB{ apple: null, cake: "pie" };
    }
}