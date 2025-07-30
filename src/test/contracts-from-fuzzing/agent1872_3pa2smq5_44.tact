// generic test: duplicate defaults assignment
contract DefaultsTwice {
    a: Int = 1;
    b: Int = 2;

    init() {
        self.a = 5;
        self.b = 10;
    }
}