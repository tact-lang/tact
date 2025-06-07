struct S {
    a: Int as uint4;
    b: Int as int8;
    c: Int as uint16;
    d: Bool;
    e: Int;
}

contract TestContract {
    data: S;
    init() {
        self.data = S{
            a: 7, b: -5, c: 65535, d: true, e: -12345
        };
    }
}