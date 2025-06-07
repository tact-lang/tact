struct SFull {
    i: Int;
    b: Bool;
    s: String;
}

struct SOpt {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract TestContract {
    v1: SFull;
    v2: SOpt;
    init() {
        self.v1 = SFull{i:1,b:true,s:"hi"};
        self.v2 = SOpt{i:null,b:true,s:null};
    }
}