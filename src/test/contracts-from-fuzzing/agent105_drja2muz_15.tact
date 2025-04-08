struct S1 {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct S2 {
    x: Int?;
    y: Bool?;
    z: String?;
    inner: S1?;
}

contract TestContract {
    deepOpt: S2?;

    init() {
        self.deepOpt = S2{
            x: null,
            y: null,
            z: null,
            inner: null
        };
    }

    receive() {}
}