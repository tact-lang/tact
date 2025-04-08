struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    c: Bool;
    d: Address;
    e: S1;
}

contract NestedMix {
    value: S2;

    init() {
        self.value = S2{
            c: true,
            d: myAddress(),
            e: S1{a:5, b:"ok"}
        };
    }
}