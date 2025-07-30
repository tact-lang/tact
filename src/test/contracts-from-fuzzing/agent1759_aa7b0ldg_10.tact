// contract with many primitive persistent vars but no struct
contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Int;
    h: Bool;
    i: Address;
    j: String;
    k: Cell;
    l: Slice;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
        self.d = "hi";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = 2;
        self.h = true;
        self.i = myAddress();
        self.j = "hey";
        self.k = emptyCell();
        self.l = emptyCell().asSlice();
    }

    receive() {}
}