struct S1 {
    a: Int;
    b: Bool;
    c: String;
}

contract TestContract {
    data: S1;

    init() {
        self.data = S1{ a: 1, b: true, c: "test" };
    }
}