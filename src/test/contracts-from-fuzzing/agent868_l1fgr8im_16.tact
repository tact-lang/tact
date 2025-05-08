struct Plain {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    p: Plain;

    init() {
        self.p = Plain{ a: 123, b: true, c: "hi" };
    }

    receive() {}
}