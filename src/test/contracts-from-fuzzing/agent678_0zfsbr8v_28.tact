struct S {
    a: Int;
    b: Bool;
    c: String;
}

contract OptionalEmbedded {
    s: S?;

    init() {
        self.s = S{a:1,b:true,c:"x"};
    }
}