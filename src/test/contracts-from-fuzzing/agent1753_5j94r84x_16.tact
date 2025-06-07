struct BigNest {
    c: ComplexStruct;
    optStr: String?;
}

struct ComplexStruct {
    text: String;
    flag: Bool?;
    addr: Address;
}

contract DeeplyComposed {
    data: BigNest;
    init() {
        self.data = BigNest{
            c: ComplexStruct{
                text: "hi",
                flag: null,
                addr: myAddress(),
            },
            optStr: null,
        };
    }
}