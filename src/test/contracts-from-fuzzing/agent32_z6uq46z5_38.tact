struct A { x: Int }
struct B { y: Int }
contract SwapStructFields {
    f1: A;
    f2: B;
    f3: A;
    init() {
        self.f1 = A{ x: 1 };
        self.f2 = B{ y: 2 };
        self.f3 = A{ x: 3 };
    }
}
