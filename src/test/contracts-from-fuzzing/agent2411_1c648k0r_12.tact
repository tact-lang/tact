struct S {
    x: Int;
    y: Bool;
    z: String?;
}

contract ManyOptionals {
    a: S?;
    b: S?;
    c: S?;
    d: S?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}