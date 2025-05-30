struct IntOpt {
    val: Int?;
}

struct AddressOpt {
    val: Address?;
}

struct StringOpt {
    val: String?;
}

contract VariousOptionals {
    a: IntOpt;
    b: AddressOpt;
    c: StringOpt;

    init() {
        self.a = IntOpt{ val:null };
        self.b = AddressOpt{ val:null };
        self.c = StringOpt{ val:null };
    }
}