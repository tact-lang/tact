struct Tiny1 { v1: Int = 1; }
struct Tiny2 { v2: Int = 2; }
struct Tiny3 { v3: Int = 3; }
struct Tiny4 { v4: Int = 4; }

contract TestContract {
    t1: Tiny1;
    t2: Tiny2;
    t3: Tiny3;
    t4: Tiny4;
    init() {
        self.t1 = Tiny1{};
        self.t2 = Tiny2{};
        self.t3 = Tiny3{};
        self.t4 = Tiny4{};
    }
    receive() {}
}