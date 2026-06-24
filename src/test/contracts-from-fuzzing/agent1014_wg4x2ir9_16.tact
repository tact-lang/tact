struct S1 { x: Int }

contract Test {
    s: S1;

    init() {
        self.s = S1{ x: 7 };
    }
}
