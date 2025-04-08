struct Compose {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract FullSet {
    var: Compose;

    init() {
        self.var = Compose{
            a:1,b:true,c:"hi",d:null,e:null,f:"bye"
        };
    }
}
