struct Orderly {
    a: Int;
    b: Int;
    c: Int;
}

contract TestContract {
    s: Orderly;

    init() {
        self.s = Orderly{
            c: 3,
            a: 1,
            b: 2,
        };
    }
}