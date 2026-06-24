struct NestedMore {
    a: Int;
    b: String?;
    c: Bool;
}

contract ManyOptional {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    f4: NestedMore;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = "hi";
        self.f4 = NestedMore{a:1, b:null, c:true};
    }
}