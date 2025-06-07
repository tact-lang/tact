struct InnerAddr {
    address: Address;
}

struct WrapAddrOpt {
    inner: InnerAddr?;
}

contract NullableInnerAddrTest {
    data: WrapAddrOpt;

    init() {
        self.data = WrapAddrOpt{ inner: null };
    }
}