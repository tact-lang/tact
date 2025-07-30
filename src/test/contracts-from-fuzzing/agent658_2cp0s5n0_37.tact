struct BigDefault {
    a: Int = 1;
    b: Bool = false;
    c: String = "test";
    d: Address;
    e: Int? = null;
    f: Bool? = null;
    g: String? = null;
    h: Address? = null;
}

contract DefaultsBig {
    big: BigDefault;

    init() {
        self.big = BigDefault{
            d: myAddress()
        };
    }
}