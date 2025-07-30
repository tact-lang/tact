struct ST {
    x: Int;
    y: Bool;
}

contract Diverse {
    i: Int = 10;
    b: Bool = true;
    s: String? = null;
    a: Address? = null;
    c: Cell? = null;
    sl: Slice? = slice("te6cckEBAQEAAgAAAEysuc0=");
    st: ST = ST{ x: 1, y: false };

    init() {
        self.i = 20;
        self.b = false;
        self.s = "hi";
        self.a = null;
        self.c = null;
        self.sl = slice("te6cckEBAQEAAgAAAEysuc0=");
        self.st = ST{ x: 2, y: true };
    }
}