struct BoolNest {
    a: Bool;
    b: Bool;
    c: Bool;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Bool;
}

contract ManyBools {
    field: BoolNest = BoolNest{
        a:true,b:true,c:true,d:true,e:true,f:true,g:true,h:true,i:true
    };
}