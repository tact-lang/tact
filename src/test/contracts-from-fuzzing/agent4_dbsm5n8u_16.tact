struct S {
    a: Int;
    b: String;
}

contract TestContract {
    s_arr: S;
    count: Int as uint8;

    init() {
        self.s_arr = S{ a: 1, b: "test" };
        self.count = 42;
    }
}