struct OptS {
    x: Int?;
}

contract AssignNestedOptional {
    s: OptS;

    init() {
        self.s = OptS{ x:null };
        self.s.x = 7;
    }
}