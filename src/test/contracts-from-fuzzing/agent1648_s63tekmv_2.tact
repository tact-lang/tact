struct S {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
}

contract TestContract {
    data: S;

    init() {
        self.data = S{
            a: 1,
            b: null,
            c: 3,
            d: 4
        };
    }
}