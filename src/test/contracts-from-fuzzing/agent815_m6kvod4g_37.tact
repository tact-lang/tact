struct ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: String;
    f: String;
    g: Bool;
    h: Bool;
    i: Address;
    j: Address;
}

contract DiverseTen {
    foo: ManyFields;

    init() {
        self.foo = ManyFields{
            a:1,b:2,c:3,d:4,e:"e",f:"f",g:true,h:false,i:myAddress(),j:myAddress()
        };
    }
}