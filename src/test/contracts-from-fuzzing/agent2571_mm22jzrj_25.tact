struct Separate {
    a: Int;
    b: Bool;
    c: String;
}

contract SeparateFields {
    f1: Separate;
    f2: Separate;
    f3: Separate;

    init() {
        self.f1 = Separate{a:1,b:true,c:"x"};
        self.f2 = Separate{a:2,b:false,c:"y"};
        self.f3 = Separate{a:3,b:true,c:"z"};
    }
}
