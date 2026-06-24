struct Flattened {
    a: Int;
    b: String;
    c: Bool;
    d: Bool?;
    e: Int?;
    f: String?;
    g: Int;
    h: Bool;
}

contract FlatStorage {
    huge: Flattened;

    init() {
        self.huge = Flattened{
            a:1,b:"b",c:true,d:null,e:null,f:null,g:7,h:false
        };
    }
}