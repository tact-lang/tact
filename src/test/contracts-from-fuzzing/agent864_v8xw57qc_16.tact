struct S {
    foo: Int;
    bar: Bool;
}

contract Defaults {
    data: S;

    init() {
        self.data = S{ foo: 123, bar: false };
    }

    receive() {
        self.data = S{ foo: 999, bar: true };
    }
}