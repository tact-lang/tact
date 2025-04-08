struct NestedManyOpt {
    optA: Int?;
    optB: Bool?;
    optC: String?;
}

contract ManyOptionals {
    f1: Int?;
    f2: Bool?;
    f3: String?;
    nested: NestedManyOpt?;

    init() {
        self.f1 = 1;
        self.f2 = true;
        self.f3 = "hi";
        self.nested = NestedManyOpt{optA:null,optB:null,optC:null};
    }
}
