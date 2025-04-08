struct S1 { x: Int; }
struct S2 { y: Int; }

contract TestContract {
    s1: S1;
    s2: S2?;

    init() {
        self.s1 = S1{ x: 5 };
        self.s2 = null;
    }

    receive() {}
}