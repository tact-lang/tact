struct S {
    value: Int = 5;
    text: String = "Sam";
}

contract DefaultStructVals {
    s: S;

    init() {
        self.s = S{};
    }
}