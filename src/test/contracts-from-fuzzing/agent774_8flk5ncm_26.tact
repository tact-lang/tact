struct A {
    u: Int as uint4;
    i: Int as int16;
    b: Bool;
    s: String;
}

contract SerializeParams {
    param: A;
    init() {
        self.param = A{ u: 15, i: -123, b: true, s: "!" };
    }
}