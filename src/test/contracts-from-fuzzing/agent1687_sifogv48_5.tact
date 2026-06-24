struct BigStruct {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: String;
    f: Bool;
    g: String;
    h: Int;
    i: Bool;
    j: String;
    k: Int;
    l: String;
    m: Bool;
    n: Int;
    o: String;
    p: Bool;
    q: Int;
}

contract Test {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1,b:2,c:3,d:true,e:"e",f:false,g:"g",h:8,i:true,j:"j",k:11,l:"l",
            m:false,n:14,o:"o",p:true,q:17
        };
    }
}