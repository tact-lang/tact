struct Mix {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
}

contract MixFields {
    f1: Int;
    f2: Mix;
    f3: Bool?;
    f4: String;

    init() {
        self.f1 = 5;
        self.f2 = Mix{ a:1, b:true, c:"x", d:null, e:false, f:"y" };
        self.f3 = null;
        self.f4 = "test";
    }
}