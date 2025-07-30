struct S { a: Int }
contract Cycle {
    x: S;
    init() {
        self.x = S{a: 1};
    }
}