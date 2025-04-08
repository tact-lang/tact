contract TestContract {
    n: Int = 42;
    s: String = "abc";
    b: Bool = true;

    init() {
        self.n = 24;
        self.s = "cba";
        self.b = false;
    }

    get fun data(): Int {
        return self.n;
    }

    receive(){}
}