struct BigNested1 {
    v1: Int;
    v2: Bool;
    v3: String;
    v4: Int;
    v5: Bool;
}

struct BigNested2 {
    x1: String;
    x2: Int;
    x3: Bool;
    x4: String;
    x5: Int;
}

struct TopBig {
    nest1: BigNested1;
    nest2: BigNested2;
    ok: Bool;
    comment: String;
}

contract ManyStructs {
    storage: TopBig;

    init() {
        self.storage = TopBig{
            nest1: BigNested1{ v1:1,v2:true,v3:"hi",v4:4,v5:false },
            nest2: BigNested2{ x1:"x",x2:2,x3:true,x4:"y",x5:5 },
            ok:true,
            comment:"all",
        };
    }
}
