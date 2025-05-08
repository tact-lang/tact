struct Big {
    x: Int;
    extra: Slice as remaining;
}

contract RemainderPersist {
    data: Big;

    init() {
        self.data = Big{
            x: 17,
            extra: "hello".asComment().asSlice()
        };
    }
}

contract Dummy {receive(){}}