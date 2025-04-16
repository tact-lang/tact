struct MixPrimitive {
    a: Int;
    b: Bool;
    c: String;
}

contract MultiPrimFields {
    f: MixPrimitive;
    init() {
        self.f = MixPrimitive{a:3,b:true,c:"abc"};
    }
}