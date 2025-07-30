struct Mix {
    a: Int;
    b: Bool;
    c: Bool?;
    d: String;
    e: String?;
    f: Int?;
}

contract TestContract {
    mixed: Mix;
    optMixed: Mix?;

    init() {
        self.mixed = Mix{a:1, b:true, c:null, d:"hi", e:null, f:null};
        self.optMixed = null;
    }
}