struct S {
    a: Int?;
    b: String?;
    c: SubS?;
}

struct SubS {
    val: Int;
}

contract OptCombo {
    pers: S;

    init() {
        self.pers = S{
            a: null,
            b: null,
            c: null,
        };
    }

    receive() {
        if (self.pers.c != null) {
            dump(self.pers.c!!.val);
        }
    }
}