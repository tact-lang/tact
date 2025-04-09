struct S {
    a: Int;
    b: Bool;
}

contract TestStructGetter {
    s: S = S{ a: 100, b: true };

    receive() {}

    get fun getS() : S {
        return self.s;
    }
}
