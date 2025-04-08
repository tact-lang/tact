struct A1 { x: Int; }
struct A2 { x: Int; }

contract ManySimilar {
    f1: A1;
    f2: A1;
    f3: A2;
    f4: A2;

    init() {
        self.f1 = A1{ x:1 };
        self.f2 = A1{ x:2 };
        self.f3 = A2{ x:3 };
        self.f4 = A2{ x:4 };
    }

    receive() {
        self.f2 = A1{ x:5 };
    }
}