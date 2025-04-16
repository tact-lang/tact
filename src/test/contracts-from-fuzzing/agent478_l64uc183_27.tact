struct LotsOfBools {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
    k: Bool;
    l: Bool;
    m: Bool;
    n: Bool;
    o: Bool;
    p: Bool;
}

contract BoolPack {
    flags: LotsOfBools = LotsOfBools{
        a:true,b:false,c:true,d:false,e:true,f:false,g:true,h:false,
        i:true,j:false,k:true,l:false,m:true,n:false,o:true,p:false
    };
}