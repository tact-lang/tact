struct Complex {
    arrMap: map<Int, Int>;
    maybeStr: String?;
    nested: Inner;
}

struct Inner {
    flag: Bool;
}

contract Test {
    data: Complex;

    init() {
        self.data = Complex{
            arrMap: emptyMap(),
            maybeStr: null,
            nested: Inner{ flag: true }
        };
    }
}