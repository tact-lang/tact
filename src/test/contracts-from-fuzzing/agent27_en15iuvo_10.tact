struct S {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
}

contract StructInTwo {
    foo: S;
    bar: S;

    init() {
        self.foo = S{
            a:1,b:true,c:"x",d:myAddress(),
            e:null,f:null,g:null,h:null
        };
        self.bar = S{
            a:2,b:false,c:"y",d:myAddress(),
            e:null,f:null,g:null,h:null
        };
    }
}