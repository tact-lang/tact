struct Large {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String;
    f: Bool?;
    g: String;
    h: Int;
    i: Bool;
    j: String;
}

contract TestContract {
    big: Large;
    
    init() {
        self.big = Large{
            a:1,b:true,c:"A",d:null,e:"B",f:false,g:"C",h:7,i:true,j:"D"
        };
    }
}