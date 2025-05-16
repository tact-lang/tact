struct Sub {
    foo: Int;
    bar: Bool;
}

contract InitAssign {
    s: Sub;
    init() {
        self.s = Sub{ foo: 10, bar: true };
    }
    receive() {}
}
