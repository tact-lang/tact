struct Minimal {
    x: Int;
}

contract ManyMinimalOptionals {
    a: Minimal?;
    b: Minimal?;
    c: Minimal?;
    d: Minimal?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}