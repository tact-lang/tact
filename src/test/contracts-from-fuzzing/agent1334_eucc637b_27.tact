struct DefaultVals {
    a: Int = 7;
    b: Bool = true;
    c: String = "hi";
}

contract DefaultStructVals {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{ a: 8, b: false, c: "hello" };
    }
}