struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract OptSField {
    opt: S?;

    init() {
        self.opt = S{
            a:42,
            b:false,
            c:"xyz"
        };
    }
}