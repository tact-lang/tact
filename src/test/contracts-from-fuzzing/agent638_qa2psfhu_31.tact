struct Big {
    a: Int as uint1;
    b: Int as uint2;
    c: Int as uint3;
    d: Int as uint4;
    e: Int as uint5;
    f: Int as uint6;
    g: Int as uint7;
    h: Int as uint8;
    i: Int as uint9;
    j: Int as uint10;
    k: Int as uint11;
    l: Int as uint12;
    m: Int as uint13;
}

contract HugeBits {
    big: Big = Big{
        a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,k:11,l:12,m:13
    };

    receive() {}
}