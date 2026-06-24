struct Params {
    a: Int?;
    b: Bool?;
}

contract TestC {
    p: Params?;

    init() {
        self.p = Params{ a: null, b: true };
    }
}