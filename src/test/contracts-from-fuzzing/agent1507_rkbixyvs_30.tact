struct Mix {
    i: Int;
    s: String;
    b: Bool;
}

contract ManyPersistents {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Mix;
    f5: Int?;
    f6: String?;
    f7: Bool?;
    f8: Mix?;

    init() {
        self.f1 = 10;
        self.f2 = false;
        self.f3 = "abc";
        self.f4 = Mix{i:1,s:"two",b:true};
        self.f5 = null;
        self.f6 = "yes";
        self.f7 = null;
        self.f8 = null;
    }
}
