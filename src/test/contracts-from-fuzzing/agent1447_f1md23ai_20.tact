struct S1 { x: Int }
struct S2 { y: Int }

contract MultiStructs {
    first: S1;
    second: S2;

    init() {
        self.first = S1{ x: 1 };
        self.second = S2{ y: 2 };
    }
}