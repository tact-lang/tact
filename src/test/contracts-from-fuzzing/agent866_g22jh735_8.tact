struct S { p: Int; q: Bool }

contract InitAllRequired {
    a: Int;
    b: String;
    s: S;

    init() {
        self.a = 7;
        self.b = "hi";
        self.s = S{ p: 2, q: false };
    }
}

contract Dummy { receive() {} }