struct SubB {
    i: Int;
    s: String;
}

contract MultiAssigns {
    a: SubB;
    b: SubB;

    init() {
        self.a = SubB{i:1,s:"x"};
        self.b = SubB{i:2,s:"y"};
        self.a = SubB{i:3,s:"z"};
    }
}