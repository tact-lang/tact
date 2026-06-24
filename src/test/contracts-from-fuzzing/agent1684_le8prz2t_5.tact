struct ManyFields {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;
}

contract LargeStructContract {
    storage: ManyFields = ManyFields{
        a:1, b:true, c:null, d:false, e:2, f:true, g:3, h:null, i:4, j:false
    };

    init() {
        self.storage = ManyFields{
            a:5, b:false, c:6, d:true, e:7, f:false, g:null, h:true, i:8, j:true
        };
    }
}