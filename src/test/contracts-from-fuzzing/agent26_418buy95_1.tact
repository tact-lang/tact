struct S1 { x: Int }

contract C1 {
    field: S1;

    init() {
        self.field = S1{ x: 5 };
    }
}