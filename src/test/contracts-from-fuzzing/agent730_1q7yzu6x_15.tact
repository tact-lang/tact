struct Nested {
    a: Int;
    b: Bool;
    c: String;
}

contract LargeList {
    f1: Int;
    f2: Bool;
    f3: String;
    f4: Nested;
    f5: Int?;
    f6: Bool?;
    f7: String?;
    f8: Nested;
    
    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "hello";
        self.f4 = Nested{a:1,b:true,c:"foo"};
        self.f5 = null;
        self.f6 = null;
        self.f7 = null;
        self.f8 = Nested{a:2,b:false,c:"bar"};
    }
}
