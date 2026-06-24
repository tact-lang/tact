struct Weird {
    a: Int as uint4;
    b: Bool;
}

contract TestContract {
    w: Weird;

    init() {
        self.w = Weird{
            a: 9,
            b: true,
        };
    }
}
