struct ABigOne {
    a: Int;
    b: Bool;
    c: String;
    d: Bool?;
    e: String;
    f: Address;
    g: Bool;
    h: Int?;
    i: String;
    j: Bool;
    k: Int;
}

contract BigFields {
    s: ABigOne;

    init() {
        self.s = ABigOne{
            a:1,b:false,c:"hi",d:null,e:"x",
            f:myAddress(),g:true,h:7,i:"y",j:false,k:42
        };
    }
}