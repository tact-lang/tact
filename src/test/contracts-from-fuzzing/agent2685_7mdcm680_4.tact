struct BigStruct {
    a: Int;
    b: Int;
    c: Bool;
    d: Int?;
    e: Bool?;
    f: Int;
    g: Int?;
    h: Bool;
    i: Int;
    j: Bool?;
}

contract Test {
    big: BigStruct = BigStruct{
        a:1,b:2,c:true,d:null,e:null,f:3,g:null,h:false,i:4,j:true
    };
}
