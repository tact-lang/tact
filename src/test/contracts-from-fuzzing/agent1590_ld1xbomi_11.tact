struct BoolWrap {
    b: Bool;
}

struct IntWrap {
    i: Int;
}

struct AddressWrap {
    addr: Address;
}

struct Combined {
    b: BoolWrap;
    i: IntWrap;
    a: AddressWrap;
}

contract CombinedNested {
    content: Combined;

    init() {
        self.content = Combined {
            b: BoolWrap{b:true},
            i: IntWrap{i:42},
            a: AddressWrap{addr: myAddress()}
        };
    }
}