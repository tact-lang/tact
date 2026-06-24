struct Fancy {
    a: Int = 1;
    b: Int;
    c: Int = 3;
}

contract PartialStructInit {
    f: Fancy;

    init() {
        self.f = Fancy{ b: 2 };
    }
}