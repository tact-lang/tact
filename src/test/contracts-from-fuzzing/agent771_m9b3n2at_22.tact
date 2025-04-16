contract BigOptionalStruct {
    large: Large?;

    init() {
        self.large = null;
    }
}

struct Large {
    a: Int;
    b: Bool;
    c: Address;
    d: Int;
    e: Bool;
    f: Address;
    g: Int;
    h: Bool;
    i: Address;
    j: String;
}