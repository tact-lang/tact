struct WithOptionalBools {
    a: Bool?;
    b: Bool?;
}

contract OptionalBoolsAssigns {
    s: WithOptionalBools;

    init() {
        self.s = WithOptionalBools{a:null,b:true};
    }
}