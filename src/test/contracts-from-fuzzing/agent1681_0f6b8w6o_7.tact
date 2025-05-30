struct ManyFields {
    a: Int; b: Int; c: Int; d: Int; e: Int;
    f: Int; g: Int; h: Int; i: Int; j: Int;
    k: Int; l: Int; m: Int; n: Int; o: Int;
    p: Int; q: Int; r: Int; s: Int; t: Int;
}

contract WideContract {
    data: ManyFields;

    init() {
        self.data = ManyFields{
            a:1,b:2,c:3,d:4,e:5,f:6,g:7,h:8,i:9,j:10,
            k:11,l:12,m:13,n:14,o:15,p:16,q:17,r:18,s:19,t:20
        };
    }

    receive() {
        self.data = ManyFields{
            a:self.data.a+1,b:self.data.b+1,c:self.data.c+1,d:self.data.d+1,e:self.data.e+1,
            f:self.data.f+1,g:self.data.g+1,h:self.data.h+1,i:self.data.i+1,j:self.data.j+1,
            k:self.data.k+1,l:self.data.l+1,m:self.data.m+1,n:self.data.n+1,o:self.data.o+1,
            p:self.data.p+1,q:self.data.q+1,r:self.data.r+1,s:self.data.s+1,t:self.data.t+1
        };
    }
}