struct S {
    i: Int;
    b: Bool;
}

contract ManyStructOptionals {
    a: S?;
    b: S?;
    c: S?;

    init() {
        self.a = null;
        self.b = S{i:1,b:true};
        self.c = null;
    }
}