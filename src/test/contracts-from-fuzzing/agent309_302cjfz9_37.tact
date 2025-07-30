struct MixedTypes {
    i: Int;
    b: Bool;
    s: String;
    a: Address;
}

contract DirectMix {
    f: MixedTypes;
    init() {
        self.f = MixedTypes{ i:1, b:true, s:"s", a:myAddress() };
    }
}