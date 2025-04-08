struct Combo {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract TestContract {
    comboField: Combo = Combo{a:5, b:true, c:"hi", d:null, e:null, f:null};

    init() {
        self.comboField = Combo{a:5, b:true, c:"hi", d:null, e:null, f:null};
    }

    receive() {
        dump(self.comboField.d);
    }
}