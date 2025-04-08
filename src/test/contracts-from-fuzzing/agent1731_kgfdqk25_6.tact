struct LargeNested {
    s1: Inner1;
    s2: Inner2;
}

struct Inner1 {
    intField: Int;
    boolField: Bool?;
    stringField: String;
}

struct Inner2 {
    addrField: Address;
    cellField: Cell?;
    textField: String?;
}

contract Test {
    data: LargeNested;

    init() {
        self.data = LargeNested{
            s1: Inner1{
                intField: 10,
                boolField: null,
                stringField: "ok"
            },
            s2: Inner2{
                addrField: myAddress(),
                cellField: null,
                textField: null
            }
        };
    }
}
