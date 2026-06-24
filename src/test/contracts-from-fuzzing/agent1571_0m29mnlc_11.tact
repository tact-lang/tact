struct InfoA {
    a: Int;
    b: Bool;
}

struct InfoB {
    c: String;
    d: Int?;
}

struct InfoC {
    e: Bool;
    f: String;
}

contract TestContract {
    ia: InfoA = InfoA{ a: 1, b: false };
    ib: InfoB = InfoB{ c: "", d: null };
    ic: InfoC = InfoC{ e: true, f: "hi" };

    init() {
        self.ia = InfoA{ a: 2, b: true };
        self.ib = InfoB{ c: "x", d: 123 };
        self.ic = InfoC{ e: false, f: "y" };
    }
}