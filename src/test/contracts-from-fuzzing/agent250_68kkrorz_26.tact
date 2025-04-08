struct S {
    a: Int;
    b: Bool;
    s: String;
}

contract MixedInitDefault {
    f: S;

    init() {
        self.f = S{a:1, b:true, s:"hi"};
    }
}