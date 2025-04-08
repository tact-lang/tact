struct MixAddress {
    a: Address;
    b: Address?;
    c: Int;
    d: Int?;
}

contract TestContract {
    x: MixAddress;

    init() {
        self.x = MixAddress{ a:myAddress(), b:null, c:42, d:null };
    }
}