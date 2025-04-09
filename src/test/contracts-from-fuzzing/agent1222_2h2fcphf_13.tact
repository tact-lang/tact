struct Sub1 { x: Int }
struct Sub2 { y: Int }
struct Wrapper {
    a: Sub1;
    b: Sub2;
}

contract TestWrap {
    f: Wrapper;
    init() {
        self.f = Wrapper{ a: Sub1{ x: 1 }, b: Sub2{ y: 2 } };
    }
}