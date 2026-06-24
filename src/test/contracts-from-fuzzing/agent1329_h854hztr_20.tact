struct Mix {
    a: Int as uint32;
    b: Bool;
    c: String?;
    d: Int;
}

contract ComboPersistent {
    rec: Mix;

    init() {
        self.rec = Mix{ a:1, b:true, c:null, d:5 };
    }
}
