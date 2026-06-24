struct A {
    iv: Int;
    bv: Bool;
    sv: String;
}

contract Test {
    a: A;
    init() {
        self.a = A{ iv: 42, bv: true, sv: "hello" };
    }
}