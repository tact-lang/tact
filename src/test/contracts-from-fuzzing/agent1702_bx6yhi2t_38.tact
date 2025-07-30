struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int;
    h: String?;
    i: Int?;
    j: Bool;
    k: String;
    l: Bool;
}

contract LargeStructContract {
    field: Large;

    init() {
        self.field = Large{
            a:1,b:true,c:"C",d:null,e:false,f:"F",g:7,h:null,i:9,j:false,k:"K",l:true
        };
    }
}
