struct S {
    a: Int;
    b: Bool?;
    c: String;
}

contract NullableBoolInsideStruct {
    s: S;

    init() {
        self.s = S{
            a: 9,
            b: null,
            c: "Hi"
        };
    }
}