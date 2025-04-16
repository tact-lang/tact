struct Mix {
    i: Int;
    o: Int?;
    b: Bool;
    ob: Bool?;
}

contract Mixes {
    f: Mix;
    init() {
        self.f = Mix {
            i:1,
            o:null,
            b:true,
            ob:null
        };
    }
}