struct Inner {
    address: Address;
    msg: String?;
}

struct Outer {
    id: Int;
    flag: Bool;
    nested: Inner;
}

contract NestedStructs {
    data: Outer;

    init() {
        self.data = Outer{
            id: 123,
            flag: true,
            nested: Inner{
                address: myAddress(),
                msg: null,
            }
        };
    }
}