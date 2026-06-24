struct Big {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;
}

contract HugeStructField {
    big: Big;
    init() {
        self.big = Big{
            a:1,b:true,c:"a",d:2,e:false,f:"b",
            g:3,h:true,i:"c",j:4,k:false,l:"d"
        };
    }
}