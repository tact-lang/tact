struct Complex {
    s: Simple?;
    flag: Bool;
}

struct Simple {
    num: Int;
    text: String;
}

contract OptionalStructField {
    data: Complex;

    init() {
        self.data = Complex{ s: null, flag: true };
    }
}