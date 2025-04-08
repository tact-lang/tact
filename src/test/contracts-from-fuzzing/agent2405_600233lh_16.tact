struct RecA { b: RecB; }
struct RecB { c: Int; }

contract RecContract {
    val: RecA;

    init() {
        self.val = RecA{ b: RecB{ c: 10 } };
    }
}