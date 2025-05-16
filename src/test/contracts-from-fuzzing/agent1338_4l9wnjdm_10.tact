struct BigOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;
}

contract ManyOptionals {
    val: BigOptional;

    init() {
        self.val = BigOptional{
            a:null, b:true, c:null, d:null, e:false, f:"hello", g:42, h:null, i:"bye"
        };
    }
}