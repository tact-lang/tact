struct LargeStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
    m: Int;
    n: Bool;
    o: String;
}

contract TestContract {
    big: LargeStruct = LargeStruct{
        a:1,b:true,c:"",
        d:null,e:null,f:null,
        g:2,h:false,i:"abc",
        j:null,k:null,l:null,
        m:42,n:true,o:"text"
    };
}