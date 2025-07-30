struct StructManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Int;
    h: Int;
    i: Int;
    j: Int;
    k: Int;
    l: Int;
    m: Int;
    n: Int;
    o: Int;
    p: Int;
}

contract ManyStructFields {
    s: StructManyFields;

    init() {
        self.s = StructManyFields{
            a:1,b:1,c:1,d:1,e:1,f:1,g:1,h:1,
            i:1,j:1,k:1,l:1,m:1,n:1,o:1,p:1,
        };
    }
}
