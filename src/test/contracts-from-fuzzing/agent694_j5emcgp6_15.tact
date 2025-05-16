struct ManyOptional {
    a: Int?;
    b: Int?;
    c: Bool?;
    d: String?;
    e: Int?;
    f: Bool?;
    g: String?;
}

contract TestContract {
    data: ManyOptional;

    init() {
        self.data = ManyOptional{
            a:null, b:null, c:null, d:null, e:null, f:null, g:null
        };
    }
}