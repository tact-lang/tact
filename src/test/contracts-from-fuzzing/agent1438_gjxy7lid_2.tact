contract LargeMixedStorage {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Int as uint16 = 3;
    d: Int as int64 = 4;
    e: Bool = true;
    f: Bool = false;
    g: String = "g";
    h: String = "h";
    i: Int? = null;
    j: Bool? = null;
    k: String? = null;
    l: Address; // uninitialized, should require init
    m: Address? = null;
    n: Int = 5;
    o: Int as uint32 = 6;
    p: Int as int128 = 7;
    q: Bool = true;
    r: String = "r";
    s: Int? = null;
    t: Bool? = null;
    u: String? = null;

    init() {
        self.l = myAddress();
    }
}