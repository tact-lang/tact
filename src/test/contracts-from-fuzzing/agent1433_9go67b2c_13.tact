struct BigBunch {
    a: Int;
    b: Int?;
    c: String;
    d: String?;
    e: Int;
    f: Int?;
    g: String;
    h: String?;
}

contract ManyStructs {
    one: BigBunch;
    two: BigBunch;

    init() {
        self.one = BigBunch{a:1,b:null,c:"1",d:null,e:2,f:null,g:"2",h:null};
        self.two = BigBunch{a:3,b:null,c:"3",d:null,e:4,f:null,g:"4",h:null};
    }
}
