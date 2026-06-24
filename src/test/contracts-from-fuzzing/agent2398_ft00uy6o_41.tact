struct TailEnd {
    a: Int;
    b: Int;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
}

contract TestContract {
    s: TailEnd;

    init() {
        self.s = TailEnd{ a:1, b:2 };
    }
}