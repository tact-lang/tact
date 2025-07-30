struct BigFields {
    a: Int;
    b: Int;
    c: Bool;
    d: String;
    e: String?;
    f: Bool?;
    g: Int; 
    h: Bool; 
    i: String;
    j: Int;
    k: Bool;
    l: String?;
    m: Int?
}

contract BigNested {
    data: BigFields;

    init() {
        self.data = BigFields{
            a:1,b:2,c:true,d:"hello",e:null,f:null,g:3,h:false,i:"world",j:5,k:true,l:null,m:null
        };
    }
}
