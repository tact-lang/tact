struct S1 { val: Int }
struct S2 { val: S1 }

contract Straight {
    f: S2;

    init() {
        self.f = S2{ val: S1{ val: 5 } };
    }
}