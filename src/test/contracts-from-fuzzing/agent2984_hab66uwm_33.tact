struct BigDefaults {
    a: Int = 1;
    b: Bool = true;
    c: Int = 2;
    d: Bool = false;
    e: Int?;
    f: Bool?;
}

contract Test34 {
    bd: BigDefaults;
    init() {
        self.bd = BigDefaults{ e: null, f: true };
    }
}
