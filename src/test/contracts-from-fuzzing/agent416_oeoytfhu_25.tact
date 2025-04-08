struct Deep {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
}

contract Test25 {
    x: Int = 0;
    deep: Deep = Deep{ a:1,b:true,c:2,d:false,e:3,f:true };
    y: Int = 10;
}