struct NestedAddr {
    a: Address;
    b: Address?;
}

struct Holder {
    one: NestedAddr;
    two: NestedAddr;
}

contract ManyAddresses {
    val: Holder;
    init() {
        self.val = Holder{
            one: NestedAddr{a:myAddress(), b:null},
            two: NestedAddr{a:myAddress(), b:myAddress()},
        };
    }
}