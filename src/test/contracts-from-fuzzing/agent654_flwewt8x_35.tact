struct X {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct W {
    x: X?;
    y: X;
}
contract TestContract {
    w: W;
    init() {
        self.w = W{
            x: null,
            y: X{ a: null, b: null, c: null }
        };
    }
}