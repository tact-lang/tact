struct Rec {
    a: Int;
    b: Bool;
    c: String;
}

contract ManyDefaults {
    v1: Int = 1;
    v2: Bool = true;
    v3: String = "hi";
    v4: Bool? = null;
    v5: Int? = null;
    v6: String? = null;
    rec: Rec = Rec{a:3, b:false, c:"foo"};

    init() {
        self.v1 = 5;
        self.v2 = false;
        self.v3 = "yo";
        self.v4 = null;
        self.v5 = null;
        self.v6 = null;
        self.rec = Rec{a:9, b:true, c: "bar"};
    }
}