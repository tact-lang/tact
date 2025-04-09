struct NestedOptional {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract TestContract {
    s1: NestedOptional;
    s2: NestedOptional;

    init() {
        self.s1 = NestedOptional{a:null,b:null,c:null};
        self.s2 = NestedOptional{a:1,b:true,c:"ok"};
    }

    receive() {}
}