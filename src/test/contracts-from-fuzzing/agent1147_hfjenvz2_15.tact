struct ManyOptional {
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

contract TestContract {
    m: ManyOptional;

    init() {
        self.m = ManyOptional{
            a:null, b:true, c:null, d:4, e:null, f:"x", g:null, h:false, i:"y"
        };
    }
}