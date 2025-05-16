struct Combination {
    a: Int;
    b: Int?;
    c: Int;
    d: Int?;
    e: Int;
    f: Int?;
    g: Int;
}

contract TestContract {
    data: Combination;

    init() {
        self.data = Combination{
            a: 1,
            b: null,
            c: 3,
            d: 4,
            e: 5,
            f: null,
            g: 7
        };
    }
}