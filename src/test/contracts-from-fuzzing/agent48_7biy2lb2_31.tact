struct X { a: Int }
struct Y { b: Int? }
struct Z { c: Int }

contract TestContract {
    f1: X;
    f2: Y;
    f3: Z;
    f4: Int?;

    init() {
        self.f1 = X{ a: 55 };
        self.f2 = Y{ b: null };
        self.f3 = Z{ c: -5 };
        self.f4 = null;
    }
}