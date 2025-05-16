struct LargeStruct {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Int = 6;
    g: Int = 7;
    h: Int = 8;
    i: Int = 9;
    j: Int = 10;
    k: Int = 11;
    l: Int = 12;
    m: Int = 13;
    n: Int = 14;
    o: Int = 15;
    p: Int = 16;
    q: Int = 17;
    r: Int = 18;
    s: Int = 19;
    t: Int = 20;
    u: Int = 21;
    v: Int = 22;
}

contract LargeStructHolder {
    big: LargeStruct = LargeStruct{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13,n:14,o:15,p:16,q:17,r:18,s:19,t:20,u:21,v:22
    };
}