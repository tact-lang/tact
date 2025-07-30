struct InnerStructSimple { iv: Int; }

contract LargeMixedFlat {
    a: Int = 1;
    b: Bool = false;
    c: String = "c";
    d: Address;
    e: Int?;
    f: String?;
    g: Address?;
    h: InnerStructSimple;
    i: Bool?;

    init() {
        self.d = myAddress();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = InnerStructSimple{ iv: 10 };
        self.i = null;
    }
}