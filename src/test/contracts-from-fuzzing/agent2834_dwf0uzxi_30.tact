struct Stuff {
    a: Int;
    b: Bool;
}

contract SameTypeList {
    s1: Stuff;
    s2: Stuff;
    s3: Stuff;

    init() {
        self.s1 = Stuff{ a:1, b:true };
        self.s2 = Stuff{ a:2, b:false };
        self.s3 = Stuff{ a:3, b:true };
    }
}