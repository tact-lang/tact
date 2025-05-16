struct Sub {
    r: Int;            // required
    o: Int?;           // optional defaults null
    d: Bool = true;    // defaulted
}

contract NestedMissingDefaults {
    f: Sub;

    init() {
        self.f = Sub{ r: 100 }; // assign required only
    }
}
