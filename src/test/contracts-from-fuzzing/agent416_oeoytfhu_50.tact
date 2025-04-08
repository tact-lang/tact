struct A { x: Int }
contract Test50 {
    a: A?;
    b: A?;
    c: A?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
    }
}
