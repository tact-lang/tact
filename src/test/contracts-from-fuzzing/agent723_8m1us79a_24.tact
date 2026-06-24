message(42) M {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    m: M?;

    init() {
        self.m = M{
            a: null,
            b: true,
        };
    }

    receive() {}
}