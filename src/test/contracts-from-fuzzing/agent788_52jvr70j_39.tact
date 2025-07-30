struct Rec1 {
    x: Int;
}

contract SerializeTest {
    a: Rec1;
    b: Bool;
    c: Int;

    init() {
        self.a = Rec1{x:1};
        self.b = true;
        self.c = 99;
    }
}