struct Deep {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

struct Wrapper {
    w: Deep;
    z: Int;
}

contract Test {
    r: Wrapper;

    init() {
        self.r = Wrapper{
            w: Deep{ a: null, b: null, c: null, d: null },
            z: 456,
        };
    }
}