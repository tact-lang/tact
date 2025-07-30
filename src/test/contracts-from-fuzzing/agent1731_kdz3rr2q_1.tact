struct A {
    a: Int;
    b: Bool;
    c: String?;
}

contract TestContract {
    s: A;

    init() {
        self.s = A{ a: 42, b: true, c: "hello" };
    }
}