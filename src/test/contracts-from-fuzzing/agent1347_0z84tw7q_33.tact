struct ManyOpts {
    a: Bool?; 
    b: Int;
    c: Bool?;
    d: Int;
    e: Bool?;
    f: Int?;
    g: Bool?; 
    h: Int?;
    i: Bool;
    j: Int?;
}

contract TestContract {
    data: ManyOpts;

    init() {
        self.data = ManyOpts{
            a:null, b:1, c:true, d:2, e:null, f:null, g:false, h:5, i:true, j:null
        };
    }
}