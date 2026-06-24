struct LargeNested {
    a: Int;
    b: Int;
    c: Bool;
    d: Int;
    e: Bool;
    f: Int;
    g: Bool;
    h: Int;
    i: Bool;
    j: Int;
    k: Bool;
    l: Int;
    m: Bool;
    n: Int;
}

contract LargeNestedFieldContract {
    nested: LargeNested = LargeNested{
        a:1,b:2,c:true,d:3,e:false,f:4,g:true,h:5,i:false,j:6,k:true,l:7,m:false,n:8
    };

    receive() {
        let sum = self.nested.a + self.nested.b + self.nested.d + self.nested.f + self.nested.h + self.nested.j + self.nested.l + self.nested.n;
    }
}