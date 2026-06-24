struct VirtuallyFlat {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
}

contract FlatMany {
    storage: VirtuallyFlat;

    init() {
        self.storage = VirtuallyFlat{
            a:1,b:true,c:"a",d:null,e:false,f:null,g:7,h:true,i:"z"
        };
    }
}