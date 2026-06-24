struct X { s: Int }

contract RepeatStructs {
    x1: X;
    x2: X;

    init() {
        self.x1 = X{ s:1 };
        self.x2 = X{ s:2 };
    }
}