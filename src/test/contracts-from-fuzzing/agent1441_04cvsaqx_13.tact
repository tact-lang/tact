struct MultiNested {
    a: Int;
    b: Bool;
    c: String;
}

contract Mix {
    f1: MultiNested;
    f2: MultiNested?;
    f3: Int;
    f4: Bool?;

    init() {
        self.f1 = MultiNested{a:1,b:true,c:"x"};
        self.f2 = null;
        self.f3 = 7;
        self.f4 = null;
    }
}