struct S {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Address;
}

contract TestContract {
    s: S;
    init() {
        self.s = S{
            a: 2,
            b: false,
            c: "hello",
            d: myAddress()
        };
    }
    receive() {
        self.s.a = 3;
    }
}