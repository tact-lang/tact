struct Bools {
    b1: Bool;
    b2: Bool;
    b3: Bool?;
    b4: Bool?;
}

contract BoolMix {
    f: Bools;

    init() {
        self.f = Bools{b1:true,b2:false,b3:null,b4:null};
    }

    receive() {
        self.f = Bools{b1:false,b2:true,b3:true,b4:false};
    }
}