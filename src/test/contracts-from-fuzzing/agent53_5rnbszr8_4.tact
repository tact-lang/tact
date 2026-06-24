struct S {
    a: Int;
    b: Bool;
}

contract Test {
    s: S = S { a: 100, b: true };

    get fun getStruct(): S {
        return self.s;
    }

    receive() {
        let value = self.getStruct();
    }
}
