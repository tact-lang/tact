contract ManyTypes {
    a: Int = 1;
    b: Bool = true;
    c: String = "abc";
    d: Int? = null;
    e: Bool? = false;
    f: String? = null;
    g: Int as uint8 = 7;
    h: Int as int8 = -7;
    i: Int as uint1 = 1;
    j: Int as int1 = 0;

    init() {
        // assign other dynamic values
    }
}