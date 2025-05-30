struct Params1 { a: Int; b: Bool?; }
struct Params2 { x: String; y: Int as uint32; }
struct Params3 { flag: Bool; data: Cell; }

contract TestContract {
    p1: Params1;
    p2: Params2;
    p3: Params3;

    init() {
        self.p1 = Params1{ a: 5, b: true };
        self.p2 = Params2{ x: "xxx", y: 12345 };
        self.p3 = Params3{ flag: false, data: emptyCell() };
    }
}
