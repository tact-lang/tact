message Empty {}

struct S {
    foo: Empty;
}

contract MsgStructField {
    s: S;

    init() {
        self.s = S{foo: Empty{}};
    }
}