struct LongStruct {
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
    s: Int;
    t: Bool;
}

contract ManyFields {
    data: LongStruct;

    init() {
        self.data = LongStruct{
            a:1,b:true,c:"",d:2,e:false,f:"",g:3,h:true,i:"",j:4,k:false,l:"",
            m:5,n:true,o:"",p:6,q:false,r:"",s:7,t:true
        };
    }
}
