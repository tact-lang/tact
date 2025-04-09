struct S {
    a: Int;
    b: Bool;
}

contract ManyOptionals {
    o1: S?;
    o2: S?;
    o3: S?;
    o4: S?;

    init() {
        self.o1 = null;
        self.o2 = null;
        self.o3 = null;
        self.o4 = null;
    }
}