struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Bool?;
    g: Bool?;
    h: String?;
}

contract TestContract {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null, h:null
        };
    }
}