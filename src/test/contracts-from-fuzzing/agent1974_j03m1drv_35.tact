struct Mid1 { a: Int; opt: Int?; }
struct Mid2 { m1: Mid1; flag: Bool; }

contract MidChain {
    x1: Mid2;
    x2: Mid2;

    init() {
        self.x1 = Mid2{ m1: Mid1{ a:1, opt:null }, flag:true };
        self.x2 = Mid2{ m1: Mid1{ a:2, opt:3 }, flag:false };
    }
}
