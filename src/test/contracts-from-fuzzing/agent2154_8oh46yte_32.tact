struct AB {
    a: Int;
    b: String;
}

struct CD {
    c: Bool;
    d: String;
}

contract MultiStructs {
    ab: AB;
    cd: CD;

    init() {
        self.ab = AB{a:1,b:"b"};
        self.cd = CD{c:true,d:"d"};
    }
}