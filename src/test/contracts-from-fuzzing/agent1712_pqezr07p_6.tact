contract TestContract {
    a: Int = 1;
    b: Bool = true;
    c: Int = 3;
    d: Bool = false;
    e: Int = 5;
    f: Bool = true;
    g: Int = 7;
    h: Bool = false;
    i: Int = 9;
    j: Bool = true;

    init() {
        self.a = 10;
    }

    receive() {
        let _ = self.i + self.c;
    }
}