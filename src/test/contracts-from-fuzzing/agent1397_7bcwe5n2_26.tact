struct MixedNested {
    field1: Int;
    field2: Bool;
    nested: Nested;
}

struct Nested {
    flag: Bool?;
    addr: Address;
    optInt: Int?;
}

contract TestContract {
    val: MixedNested;

    init() {
        self.val = MixedNested{
            field1: 1,
            field2: true,
            nested: Nested{
                flag: null,
                addr: myAddress(),
                optInt: null,
            },
        };
    }

    receive() {
        let _ = self.val.nested.flag;
        let _ = self.val.nested.addr;
        let _ = self.val.nested.optInt;
    }
}