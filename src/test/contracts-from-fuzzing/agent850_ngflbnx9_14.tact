struct AB {
    a: Int;
    b: Bool;
}

struct CD {
    c: String;
    d: Bool?;
}

contract MixedStructs {
    ab: AB;
    cd: CD;

    init() {
        self.ab = AB{a:1,b:true};
        self.cd = CD{c:"hi",d:null};
    }
}
