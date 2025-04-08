struct Combo {
    q: Int;
    w: Int?;
    e: Bool;
    r: Bool?;
    t: String;
    y: String?;
}

contract MixedOpt {
    data: Combo;

    init() {
        self.data = Combo{
            q:1,
            w:null,
            e:true,
            r:null,
            t:"hi",
            y:null
        };
    }
}