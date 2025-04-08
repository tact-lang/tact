struct Boo {
    x: Int;
    y: Bool;
}

contract FieldOrderTest {
    a: Int;
    b: Int;
    s: Boo;
    c: Bool;

    init() {
        self.a = 1;
        self.b = 2;
        self.s = Boo{x:3,y:true};
        self.c = false;
    }
}