struct StructOne {
    a: Int;
    b: Bool;
}

struct StructTwo {
    c: Address;
    d: String;
}

struct Holder {
    s1: StructOne;
    s2: StructTwo;
}

contract TwoStructs {
    storage: Holder;
    init() {
        self.storage = Holder {
            s1: StructOne { a: 4, b: false },
            s2: StructTwo { c: myAddress(), d: "hi" },
        };
    }
}
