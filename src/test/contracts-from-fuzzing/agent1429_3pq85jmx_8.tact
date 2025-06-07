struct Flat {
    a: Int;
    b: Bool;
    c: String;
}

contract FlatFields {
    fa: Int;
    fb: Bool;
    fc: String;
    fs: Flat;

    init() {
        self.fa = 1;
        self.fb = true;
        self.fc = "x";
        self.fs = Flat{ a: 2, b: false, c: "y" };
    }
}