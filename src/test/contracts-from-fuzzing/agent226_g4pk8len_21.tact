struct Numbers {
    a: Int as int1;
    b: Int as int8;
    c: Int as int64;
    d: Int as int257;
}

contract MixedWidths {
    n: Numbers;

    init() {
        self.n = Numbers{ a:1, b:2, c:3, d:4 };
    }
}