struct Mix {
    a: Int;
    b: String?;
    c: Bool;
    d: Int?;
    e: String;
    f: Bool?;
}

contract TestContract {
    v: Mix = Mix{
        a:1,b:null,c:true,d:null,e:"end",f:false
    };
}