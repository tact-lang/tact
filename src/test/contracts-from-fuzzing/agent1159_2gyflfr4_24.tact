struct RecA { x: Int; }
struct RecB { a: RecA; }
struct RecC { b: RecB; }
struct RecD { c: RecC; }

contract TestContract {
    data: RecD;

    init() {
        self.data = RecD{ c: RecC{ b: RecB{ a: RecA{ x: 42 } } } };
    }
}