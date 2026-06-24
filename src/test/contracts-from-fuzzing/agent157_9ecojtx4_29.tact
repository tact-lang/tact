struct OptionalAddressChain {
    a: Address?;
    b: NestedOptAddr?;
}

struct NestedOptAddr {
    c: Address?;
    d: Address?;
}

contract OptionalAddressChainTest {
    s: OptionalAddressChain;

    init() {
        self.s = OptionalAddressChain{
            a:null,
            b:NestedOptAddr{ c:null, d:myAddress() }
        };
    }
}
