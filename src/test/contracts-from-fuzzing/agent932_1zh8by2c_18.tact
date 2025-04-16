struct BigOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: Bool?;
    h: Bool?;
    i: Bool?;
    j: Bool?;
}

contract ManyOptionals {
    data: BigOptionals;

    init() {
        self.data = BigOptionals{
            a:null, b:1, c:null, d:2, e:null,
            f:true, g:null, h:false, i:null, j:true
        };
    }
}
