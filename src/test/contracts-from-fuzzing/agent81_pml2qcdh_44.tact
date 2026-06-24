struct Composite {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
    so: String?;
    io: Int?;
    bo: Bool?;
    ao: Address?;
}

contract Test {
    f: Composite;

    init() {
        self.f = Composite{
            i:1,b:true,s:"str",a:myAddress(),so:null,io:null,bo:null,ao:null
        };
    }
}