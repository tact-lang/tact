struct Inner {
    strVal: String;
    addrVal: Address;
}

struct Outer {
    inner: Inner;
    optionalInner: Inner?;
    optInt: Int?;
}

contract MixedOptional {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{strVal:"x", addrVal:myAddress()},
            optionalInner: null,
            optInt: null
        };
    }
}