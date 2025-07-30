struct Flat {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Address;
    f: String;
}

contract FlatStorage {
    fa: Int;
    fb: Bool;
    fc: Cell;
    fd: Slice;
    fe: Address;
    fs: String;
    fstruct: Flat;

    init() {
        self.fa = 1;
        self.fb = true;
        self.fc = emptyCell();
        self.fd = emptyCell().asSlice();
        self.fe = myAddress();
        self.fs = "str";
        self.fstruct = Flat{ a: 2, b: false, c: emptyCell(), d: emptyCell().asSlice(), e: myAddress(), f: "q" };
    }

    receive() {
        let _ = self.fa + 1 + (self.fstruct.a);
    }
}