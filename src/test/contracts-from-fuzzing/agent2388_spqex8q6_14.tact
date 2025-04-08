struct S {
    i: Int;
    b: Bool;
    s: String;
}

contract Arranged {
    sField: S;
    iField: Int;
    bField: Bool;
    strField: String;

    init() {
        self.sField = S{i:5, b:false, s:"hi"};
        self.iField = 42;
        self.bField = true;
        self.strField = "bye";
    }
}