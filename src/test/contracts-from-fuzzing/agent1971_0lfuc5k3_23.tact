struct Multi {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
}

contract MultiStructs {
    one: Multi;
    two: Multi;

    init() {
        self.one = Multi{ a:1,b:true,c:"x",d:myAddress() };
        self.two = Multi{ a:2,b:false,c:"y",d:myAddress() };
    }
}
