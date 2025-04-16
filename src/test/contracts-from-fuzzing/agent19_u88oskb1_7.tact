// contract with many primitive persistent variables
contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = "test";
    }
}