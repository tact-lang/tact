struct Inner1 { a: Int; }
struct Inner2 { b: Bool; }
struct Outer {
    f1: Inner1;
    f2: Inner2;
    n: Int?;
}

contract TestContract {
    st: Outer;

    init() {
        self.st = Outer{
            f1: Inner1{ a: 11 },
            f2: Inner2{ b: false },
            n: null
        };
    }
}