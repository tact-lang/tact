struct BigStruct {
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
    m: Int;
    n: Bool;
    o: String;
    p: Int;
    q: Bool;
    r: String;
}

contract UsesBigStruct {
    vars: BigStruct = BigStruct{
        a:1,b:true,c:"c",d:2,e:false,f:"f",g:3,h:true,i:"i",
        j:4,k:false,l:"l",m:5,n:true,o:"o",p:6,q:false,r:"r"
    };

    init() {
        self.vars.a = 33;
    }
}