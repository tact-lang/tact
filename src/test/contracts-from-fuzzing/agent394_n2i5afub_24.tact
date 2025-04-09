struct Deep {
    foo: Int?;
    bar: Bool?;
}

contract TestContract {
    d1: Deep?;
    d2: Deep?;

    init() {
        self.d1 = Deep{ foo: 1, bar: null };
        self.d2 = null;
    }
}