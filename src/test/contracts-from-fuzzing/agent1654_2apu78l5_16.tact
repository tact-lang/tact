struct Ints {
    a:Int; b:Int; c:Int; d:Int; e:Int;
}

struct Bools {
    a:Bool; b:Bool; c:Bool; d:Bool; e:Bool;
}

struct Addresses {
    a:Address; b:Address; c:Address; d:Address; e:Address;
}

contract TestContract {
    ints: Ints;
    bools: Bools;
    addresses: Addresses;

    init() {
        self.ints = Ints{a:1,b:2,c:3,d:4,e:5};
        self.bools = Bools{a:true,b:false,c:true,d:false,e:true};
        self.addresses = Addresses{
            a: myAddress(),
            b: myAddress(),
            c: myAddress(),
            d: myAddress(),
            e: myAddress()
        };
    }
}