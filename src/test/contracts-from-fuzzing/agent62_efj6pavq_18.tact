struct ComplexFields {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    s_opt: String?;
    addr: Address;
    addr_opt: Address?;
    nested: NestedInner;
}

struct NestedInner {
    val: Int;
    flag: Bool;
}

contract ComplexStorage {
    data: ComplexFields;

    init() {
        self.data = ComplexFields{
            i: 1,
            b: false,
            s: "s",
            o: null,
            s_opt: null,
            addr: myAddress(),
            addr_opt: null,
            nested: NestedInner{ val:5, flag:true },
        };
    }
}
