struct S {
    s: String;
    n: Int;
    b: Bool;
    addr: Address;
}

contract TestContract {
    a: S;

    init() {
        self.a = S{s: "text", n: 42, b: true, addr: myAddress()};
    }
}