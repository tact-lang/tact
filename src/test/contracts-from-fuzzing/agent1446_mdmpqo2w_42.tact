struct X {
    a: Int;
    b: Int?;
    c: Int as int16;
    d: Int as uint8;
    e: Bool;
    f: String;
    g: Address;
}

contract Test {
    storage: X;
    init() {
        self.storage = X{
            a:1,b:null,c:2,d:3,e:true,f:"s",g:myAddress()
        };
    }
}
