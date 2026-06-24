struct S {
    a: Int;
    b: Bool;
}

contract OptionalList {
    o1: S?;
    o2: S?;
    o3: Int?;
    o4: Bool?;

    init() {
        self.o1 = null;
        self.o2 = S{a:5, b:true};
        self.o3 = 123;
        self.o4 = null;
    }
}